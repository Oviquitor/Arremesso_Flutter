import 'package:farm/views/MenuPage/NavigationBar.dart';
import 'package:farm/views/RelatorioPage/components/custom_buttonReport.dart';
import 'package:farm/views/RelatorioPage/components/grafico/graficoScreen.dart';
import 'package:farm/views/RelatorioPage/components/graficoTabela/tabelaGraficoScreen.dart';
import 'package:farm/views/RelatorioPage/components/tabela/tabelaScreen.dart';
import 'package:flutter/material.dart';

class OpcaoRelatorio extends StatefulWidget {
  const OpcaoRelatorio({super.key});

  @override
  State<OpcaoRelatorio> createState() => _OpcaoRelatorioState();
}

class _OpcaoRelatorioState extends State<OpcaoRelatorio> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => NaviBar()),
              (Route<dynamic> route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 22, 71, 61),
        ),
        centerTitle: true,
        title: const Text(
          'Relatório',
          style: TextStyle(
            color: Color.fromARGB(255, 22, 71, 61),
          ),
        ),
      ),
      body: Container(
        width: media.height * 1.21,
        padding: EdgeInsets.symmetric(horizontal: media.width * 0.07),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            CustomButtonReport(
              titulo: 'Gráfico',
              imagem: "assets/images/grafico.png",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Grafico(),
                ),
              ),
              icone: Icons.list_alt_outlined,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 3)),
            CustomButtonReport(
              titulo: 'Tabela',
              imagem: "assets/images/tabela.png",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Tabela(),
                ),
              ),
              icone: Icons.list_alt_outlined,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 3)),
            CustomButtonReport(
              titulo: 'Gráfico/Tabela',
              imagem: "assets/images/tabela.png",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TabelaGraficoScreen(),
                ),
              ),
              icone: Icons.list_alt_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
