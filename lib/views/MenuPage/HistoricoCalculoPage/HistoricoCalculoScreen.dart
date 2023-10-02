import 'package:farm/repository/HistoricoRepositorio.dart';
import 'package:farm/stores/Resultado.dart';
import 'package:farm/views/RelatorioPage/components/grafico/graficoScreen.dart';
import 'package:farm/views/RelatorioPage/components/tabela/tabelaScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class HistoricoCalculoScreen extends StatefulWidget {
  HistoricoCalculoScreen({super.key});

  @override
  State<HistoricoCalculoScreen> createState() => _HistoricoCalculoScreenState();
}

class _HistoricoCalculoScreenState extends State<HistoricoCalculoScreen> {
  var getResultado = GetIt.I<Resultado>();
  bool _isLoading = true;

  Future<dynamic> carregado() async {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    carregado();
    getResultado.listar();
  }

  void _deleteData() async {
    await HistoricoRepositorio.deleteAll();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Excluido com sucesso"),
      ),
    );
    carregado();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = AppBar();
    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                getResultado.Data = '';
                getResultado.listar();
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2019),
                  lastDate: DateTime.now(),
                ).then(
                  (pickedDate) {
                    if (pickedDate == null) {
                      return;
                    }
                    setState(
                      () {
                        getResultado.Data = DateFormat('dd/MM/yyyy')
                            .format(pickedDate)
                            .toString();
                        getResultado.singleData(getResultado.Data);
                      },
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.calendar_month,
              ),
            ),
            actions: [
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 1) {
                    getResultado.deletarLista();
                  } else if (value == 2) {
                    getResultado.Data = '';
                    getResultado.listar();
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                position: PopupMenuPosition.under,
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Limpar histórico'),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('Limpar Filtro'),
                    ),
                  ];
                },
              )
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 22, 71, 61),
            ),
            centerTitle: true,
            title: const Text(
              'Histórico',
              style: TextStyle(
                color: Color.fromARGB(255, 22, 71, 61),
              ),
            ),
          ),
          body: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: availableHeight * 0.03),
                      child: Observer(
                        builder: (ctx) {
                          return Text(
                            getResultado.Data == ''
                                ? 'Clique no calendário para filtrar por data'
                                : '${getResultado.Data}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: availableHeight * 0.8,
                      child: ListView.builder(
                        itemCount: getResultado.resposta.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: Text(
                                      'Cálculo  ${getResultado.resposta[index]['Data']}',
                                    ),
                                    content: Text(
                                      'Esquerdo: ${getResultado.resposta[index]['ResultadoEsq'].toString()}' +
                                          '\n\n' +
                                          'Direito: ${getResultado.resposta[index]['ResultadoDir'].toString()}' +
                                          '\n\n' +
                                          'Distância: ${getResultado.resposta[index]['NDistancia'].toString()}' +
                                          '\n' +
                                          'Coletores: ${getResultado.resposta[index]['NColetores'].toString()}' +
                                          '\n' +
                                          'Nº Passadas: ${getResultado.resposta[index]['NPassadas'].toString()}',
                                      style: TextStyle(fontSize: 17),
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
                                          onPressed: () =>
                                              Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => Grafico(
                                                  data: getResultado
                                                          .resposta[index]
                                                      ['EntradaCalculo']),
                                            ),
                                          ),
                                          child: const Text('Gráfico'),
                                        ),
                                      ),
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
                                          onPressed: () =>
                                              Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => Tabela(
                                                esq:
                                                    getResultado.resposta[index]
                                                        ['ResultadoEsq'],
                                                dir:
                                                    getResultado.resposta[index]
                                                        ['ResultadoDir'],
                                              ),
                                            ),
                                          ),
                                          child: const Text('Tabela'),
                                        ),
                                      ),
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
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        'Cálculo feito em: ${getResultado.resposta[index]['Data']}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        'Direito: ${getResultado.resposta[index]['ResultadoDir'].toString()}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: Text(
                                        'Esquerdo: ${getResultado.resposta[index]['ResultadoEsq'].toString()}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Text(
                                      'Coletores: ${getResultado.resposta[index]['NColetores'].toString()}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'Nº Passadas: ${getResultado.resposta[index]['NPassadas'].toString()}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Distância: ${getResultado.resposta[index]['NDistancia'].toString()}',
                                            style:
                                                const TextStyle(fontSize: 20),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        const Expanded(
                                          child: Text(
                                            'ver mais',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.blue,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 20,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
