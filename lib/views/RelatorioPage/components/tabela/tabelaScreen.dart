import 'package:farm/stores/Resultado.dart';
import 'package:farm/views/RelatorioPage/components/tabela/geraTabela.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Tabela extends StatefulWidget {
  Tabela({super.key, this.esq, this.dir});

  var esq;
  var dir;

  @override
  State<Tabela> createState() => _TabelaState();
}

class _TabelaState extends State<Tabela> {
  var getResultado = GetIt.I<Resultado>();
  GerarTabela gera = GerarTabela();
  @override
  Widget build(BuildContext context) {
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
                  gera.criaTable(getResultado.LadoEsq, getResultado.LadoDir);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text('Atenção'),
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
          'Tabela',
          style: TextStyle(
            color: Color.fromARGB(255, 22, 71, 61),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: availableHeight * 1,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: _buildTable(esquerda, direita),
                ),
              ),
            ),
          ),
          // Container(
          //   height: availableHeight * 1,
          //   padding: EdgeInsets.all(10),
          //   child: Card(
          //     elevation: 5,
          //     child: Container(
          //       padding: EdgeInsets.all(10),
          //       child: Container(
          //         padding: const EdgeInsets.all(10),
          //         child: _buildTable(esquerda, direita),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
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
