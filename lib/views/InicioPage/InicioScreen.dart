import 'package:farm/repository/UsuarioRepositorio.dart';
import 'package:farm/stores/EventoGeral.dart';
import 'package:farm/views/InicioPage/components/autenticacao.dart';
import 'package:farm/views/MenuPage/NavigationBar.dart';
import 'package:farm/views/SuportePage/SuporteScreen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var getEvento = GetIt.I<EventoGeral>();
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.8,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: 50,
                          ),
                          children: [
                            TextSpan(
                              text: 'A',
                              style: TextStyle(
                                fontFamily: 'Coolvetica',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 22, 71, 61),
                              ),
                            ),
                            TextSpan(
                              text: 'rremesso',
                              style: TextStyle(
                                fontFamily: 'Coolvetica',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.14,
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        width: 340,
                        child: ElevatedButton(
                          onPressed: () async {
                            var usuarioEntrada =
                                await UsuarioRepositorio.getAllData();
                            if (usuarioEntrada.isNotEmpty) {
                              getEvento.usuario = usuarioEntrada;
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        NaviBar()),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              try {
                                var user =
                                    await AutenticaGoogle().fazerLoginGoogle();
                                await UsuarioRepositorio.createData(
                                  user!.displayName,
                                  user.email,
                                  user.phoneNumber,
                                  user.photoURL,
                                  user.uid,
                                  user.metadata.creationTime.toString(),
                                );
                                getEvento.listaDados();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          NaviBar()),
                                  (Route<dynamic> route) => false,
                                );
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text(
                                          'Erro ao fazer login com o Google:'),
                                      content: Text(
                                        'Não foi possível realizar o login, entre em contato com o suporte',
                                      ),
                                      actions: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Fechar'),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 14, 46, 39),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => SuporteScreen()),
                          );
                        },
                        child: const Text(
                          'Ajuda',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
