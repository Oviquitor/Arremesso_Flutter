import 'package:farm/common/Calculo.dart';
import 'package:farm/models/EntradaModel.dart';
import 'package:farm/views/RelatorioPage/RelatorioScreen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ListaDadosScreen extends StatefulWidget {
  final int itemCount;

  ListaDadosScreen({super.key, required this.itemCount});

  @override
  State<ListaDadosScreen> createState() => _ListaDadosScreenState();
}

class _ListaDadosScreenState extends State<ListaDadosScreen> {
  var getEntrada = GetIt.I<EntradaModel>();
  //var getCalculo = GetIt.I<Calculo>();
  final _formKey = GlobalKey<FormState>();
  late List<String> armazenaTela = List.filled(widget.itemCount, '');
  late List<double> calculo = List.filled(widget.itemCount, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () {
          // Esconder o teclado quando tocar fora do campo de texto
          //FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Pesagem (g)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 22, 71, 61),
                      ),
                    ),
                  ),
                  Container(
                    child: const Text(
                      'Informe abaixo os valores coletados em gramas',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.itemCount,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Bandeja ${index + 1}:',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: SizedBox(
                                  width: 150,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      isDense: true,
                                    ),
                                    initialValue: armazenaTela[index],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == '') {
                                        return 'preencha';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      if (value == "") {
                                        return;
                                      }
                                      calculo[index] = double.parse(value);
                                      armazenaTela[index] = value;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        child: const Icon(Icons.calculate),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Text('Atenção'),
                  content: const Text(
                    'Esta versão não possui o cálculo',
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
                    'Verifique se todos os itens estão preenchidos!',
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
      ),
    );
  }
}
