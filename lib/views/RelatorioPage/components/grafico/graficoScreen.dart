import 'package:charts_flutter/flutter.dart' as charts;
import 'package:farm/stores/Resultado.dart';
import 'package:farm/views/RelatorioPage/components/grafico/geraGrafico.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Grafico extends StatefulWidget {
  Grafico({super.key, this.data});
  var data;

  @override
  State<Grafico> createState() => _GraficoState();
}

class _GraficoState extends State<Grafico> {
  var getResultado = GetIt.I<Resultado>();
  GerarGrafico gera = GerarGrafico();

  @override
  Widget build(BuildContext context) {
    List dados = [];

    if (widget.data == null) {
      dados = getResultado.EntradaCalculo;
    } else {
      dados =
          widget.data.split("-").map((valor) => double.parse(valor)).toList();
    }

    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = AppBar();
    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              iconSize: 30,
              onPressed: () {
                if (getResultado.EntradaCalculo.isNotEmpty) {
                  gera.criaGrafico(getResultado.LadoEsq, getResultado.LadoDir);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Text('Atenção'),
                        content: const Text(
                          'Não há dados para serem exportados',
                        ),
                        actions: [
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Fechar'),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              icon: const Icon(Icons.download),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 22, 71, 61),
        ),
        centerTitle: true,
        title: const Text(
          'Gráfico',
          style: TextStyle(
            color: Color.fromARGB(255, 22, 71, 61),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: availableHeight,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: _buildChart(mediaQuery, dados),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildChart(mediaQuery, List dados) {
  List<charts.Series<ChartData, String>> series = [
    charts.Series(
      id: 'Columns',
      data: dados
          .asMap()
          .entries
          .map((entry) => ChartData('${entry.key}', entry.value))
          .toList(),
      domainFn: (ChartData data, _) => data.column,
      measureFn: (ChartData data, _) => data.value,
    ),
  ];

  return Container(
    padding: const EdgeInsets.all(15),
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      height: mediaQuery.size.height * 0.8,
      width: mediaQuery.size.width,
      child: charts.BarChart(
        series,
        animate: true,
        vertical: false,
        defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(17),
        ),
      ),
    ),
  );
}

class ChartData {
  final String column;
  final double value;

  ChartData(this.column, this.value);
}
