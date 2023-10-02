import 'package:charts_flutter/flutter.dart' as charts;
import 'package:farm/stores/Resultado.dart';
import 'package:farm/views/RelatorioPage/components/graficoTabela/geraTabelaGrafico.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TabelaGraficoScreen extends StatefulWidget {
  var data;
  var esq;
  var dir;

  TabelaGraficoScreen({super.key, this.data, this.esq, this.dir});

  @override
  State<TabelaGraficoScreen> createState() => _TabelaGraficoScreenState();
}

class _TabelaGraficoScreenState extends State<TabelaGraficoScreen> {
  List esquerda = [];
  List direita = [];

  var getResultado = GetIt.I<Resultado>();
  GeraTabelaGrafico gera = GeraTabelaGrafico();

  @override
  Widget build(BuildContext context) {
    List dados = [];

    if (widget.data == null) {
      dados = getResultado.EntradaCalculo;
    } else {
      dados =
          widget.data.split("-").map((valor) => double.parse(valor)).toList();
    }

    List esquerda = [];
    List direita = [];

    if (widget.esq == null || widget.dir == null) {
      esquerda = getResultado.LadoEsq;
      direita = getResultado.LadoDir;
    } else {
      esquerda =
          widget.esq.split("-").map((valor) => double.parse(valor)).toList();
      direita =
          widget.dir.split("-").map((valor) => double.parse(valor)).toList();
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
                  gera.criaTabelaGrafico(
                      getResultado.LadoEsq, getResultado.LadoDir);
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
          'Gráfico/Tabela',
          style: TextStyle(
            color: Color.fromARGB(255, 22, 71, 61),
          ),
        ),
      ),
      body: getResultado.EntradaCalculo.isEmpty
          ? const Center(
              child: Text(
                "Não há dados para serem exibidos",
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: [
                Container(
                  height: availableHeight,
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: availableHeight * 0.02),
                              child: const Center(
                                child: Text(
                                  "Gráfico",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            _buildChart(mediaQuery, dados),
                            Padding(padding: EdgeInsets.all(30)),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: availableHeight * 0.02),
                              child: const Center(
                                child: Text(
                                  "Tabela",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            _buildTable(esquerda, direita),
                          ],
                        ),
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

Widget _buildTable(List esquerda, List direita) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: DataTable(
        headingRowColor: MaterialStateColor.resolveWith(
          (states) => const Color.fromARGB(255, 198, 198, 198),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
        ),
        columns: const [
          DataColumn(
            label: Text('Lado Esquerdo'),
          ),
          DataColumn(
            label: Text('Lado Direito'),
          ),
        ],
        rows: List<DataRow>.generate(
          esquerda.length,
          (index) => DataRow(
            cells: [
              DataCell(
                Center(
                  child: Text(
                    esquerda[index].toString(),
                  ),
                ),
              ),
              DataCell(
                Center(
                  child: Text(
                    direita[index].toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
