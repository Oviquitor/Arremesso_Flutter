import 'package:farm/repository/UsuarioRepositorio.dart';
import 'package:farm/stores/EventoGeral.dart';
import 'package:farm/views/ConfiguracaoPage/components/components.dart';
import 'package:farm/views/ConfiguracaoPage/components/detalheScreen.dart';
import 'package:farm/views/InicioPage/InicioScreen.dart';
import 'package:farm/views/InicioPage/components/autenticacao.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ConfiguracaoScreen extends StatelessWidget {
  const ConfiguracaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var getEvento = GetIt.I<EventoGeral>();
    //var proVersion = true;
    bool proVersion = true;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: mediaQuery.size.height * 0.45,
                width: mediaQuery.size.width * 1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ArremessoConfig.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 80),
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 25)),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          image: DecorationImage(
                            image:
                                NetworkImage(getEvento.usuario[0]['PhotoURL']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    getEvento.usuario[0]['DisplayName'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  proVersion
                                      ? const Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Icon(
                                            Icons.diamond,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                getEvento.usuario[0]['Email'],
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            proVersion
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: SizedBox(
                                      height: 20,
                                      width: 92,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Obter Pro'),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: mediaQuery.size.height * 0.40,
                  ),
                  Container(
                    height: mediaQuery.size.height * 0.60,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 238, 243, 246),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: const Text(
                              'MINHA CONTA',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TextBottonConfiguracao(
                            title: 'Detalhes da Conta',
                            icone: Icons.person,
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetalheScreen(),
                              ),
                            ),
                          ),
                          TextBottonConfiguracao(
                            title: 'Assinatura',
                            icone: Icons.article,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: const Text('Assinatura'),
                                    content: const Text(
                                      'Função ainda não disponível',
                                    ),
                                    actions: [
                                      Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text('Fechar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          TextBottonConfiguracao(
                            title: 'Trocar de Conta',
                            icone: Icons.supervised_user_circle,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: const Text('Trocar de Conta'),
                                    content: const Text(
                                      'Deseja realmente sair dessa conta?',
                                    ),
                                    actions: [
                                      Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text('Sim'),
                                          onPressed: () {
                                            AutenticaGoogle.fazerLogout2();
                                            UsuarioRepositorio.deleteAll();
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        InicioScreen(),
                                              ),
                                              (Route<dynamic> route) => false,
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text('Não'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 20),
                          //   child: const Text(
                          //     'CONFIGURAÇÕES',
                          //     style: TextStyle(
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.w700,
                          //     ),
                          //   ),
                          // ),
                          // TextBottonConfiguracao(
                          //   title: 'Detalhes da Conta',
                          //   icone: Icons.person,
                          //   onTap: () => Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) => DetalheScreen(),
                          //     ),
                          //   ),
                          // ),
                          // TextBottonConfiguracao(
                          //   title: 'Detalhes da Conta',
                          //   icone: Icons.person,
                          //   onTap: () => Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) => DetalheScreen(),
                          //     ),
                          //   ),
                          // ),
                          // TextBottonConfiguracao(
                          //   title: 'Detalhes da Conta',
                          //   icone: Icons.person,
                          //   onTap: () => Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) => DetalheScreen(),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
