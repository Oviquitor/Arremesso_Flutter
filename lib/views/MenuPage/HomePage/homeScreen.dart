import 'package:farm/components/custom_buttonCard.dart';
import 'package:farm/views/CalculadoraPage/EntradaDadosScreen.dart';
import 'package:farm/views/ConfiguracaoPage/configuracaoScreen.dart';
import 'package:farm/views/ManualPage/manualScreen.dart';
import 'package:farm/views/RelatorioPage/RelatorioScreen.dart';
import 'package:farm/views/SuportePage/SuporteScreen.dart';
import 'package:farm/views/sobrenosPage/sobrenosScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var pro = true;
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: media.height * -0.1,
              height: media.height * 0.45,
              width: media.width * 1,
              //top: media.height * -0.10,
              //left: media.width * -0.05,
              child: Container(
                //width: media.width * 1.10,
                //height: media.height * 0.47,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/fundo.png"),
                    //image: AssetImage("assets/images/Fundo1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: media.width * 0.055),
              child: Column(
                children: [
                  Container(
                    //color: Colors.orange,
                    padding: EdgeInsets.only(top: media.width * 0.1),
                    child: Row(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Arremesso',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: media.width * 0.06),
                    //color: Colors.red,
                    child: Row(
                      children: [
                        CustomButtonCard(
                          titulo: 'Iniciar cálculo',
                          imagem: "assets/images/google1.png",
                          icone: Icons.list_alt_outlined,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CalculoMain(),
                            ),
                          ),
                        ),
                        Container(
                          width: media.width * 0.03,
                        ),
                        CustomButtonCard(
                          titulo: 'Relatórios',
                          imagem: "assets/images/relatorio1.png",
                          icone: Icons.list_alt_outlined,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OpcaoRelatorio(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: media.width * 0.04),
                    //color: Colors.purple,
                    child: Row(
                      children: [
                        CustomButtonCard(
                          titulo: 'Manual de \n Operação',
                          imagem: "assets/images/manuais1.png",
                          icone: Icons.list_alt_outlined,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ManualScreen(),
                            ),
                          ),
                        ),
                        Container(width: media.width * 0.02),
                        CustomButtonCard(
                          titulo: 'Configurações',
                          imagem: "assets/images/configuracao1.png",
                          icone: Icons.list_alt_outlined,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ConfiguracaoScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: media.width * 0.04),
                    //color: Colors.yellow,
                    child: Row(
                      children: [
                        CustomButtonCard(
                          titulo: 'Suporte',
                          imagem: "assets/images/suporte1.png",
                          icone: Icons.list_alt_outlined,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SuporteScreen(),
                            ),
                          ),
                        ),
                        Container(width: media.width * 0.02),
                        CustomButtonCard(
                          titulo: 'AgriDecode',
                          imagem: "assets/images/empresa1.png",
                          icone: Icons.list_alt_outlined,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SobreNosScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
