import 'package:farm/components/custom_buttonDistancia.dart';
import 'package:farm/components/custom_textDados.dart';
import 'package:farm/models/EntradaModel.dart';
import 'package:farm/stores/Resultado.dart';
import 'package:farm/views/CalculadoraPage/ListaDadosScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CalculoMain extends StatefulWidget {
  const CalculoMain({super.key});

  @override
  State<CalculoMain> createState() => _CalculoMainState();
}

class _CalculoMainState extends State<CalculoMain> {
  var getEntrada = GetIt.I<EntradaModel>();
  var getResultado = GetIt.I<Resultado>();
  final _formKey = GlobalKey<FormState>();
  final _numeroColetores = TextEditingController();
  final _numeroPassadas = TextEditingController();

  bool teste = true;

  @override
  void dispose() {
    _numeroColetores.dispose();
    _numeroPassadas.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final PreferredSizeWidget appBar = AppBar();
    final altura = size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 14, 46, 39),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                //color: Colors.pink,
                height: altura * 0.15,
                child: Stack(
                  children: [
                    Container(
                      height: altura * 0.15,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 14, 46, 39),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(size.width * 0.2),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: size.height * 0.05, left: size.width * 0.1),
                      child: const Text(
                        'Entrada de Dados',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: altura * 0.85,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.085),
                //color: Colors.purple,
                child: Column(
                  children: [
                    Container(
                      height: altura * 0.17,
                      //color: Colors.yellow,
                      child: Center(
                        child: Observer(
                          builder: (_) {
                            return Text(
                              "Escolha a distância em metros: ${getResultado.NDistancia}",
                              style: const TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: altura * 0.17,
                      alignment: Alignment.topCenter,
                      //color: Colors.blue,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.07),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButtonDistancia(
                              titulo: '0.5 m',
                              distancia: 0.5,
                            ),
                            CustomButtonDistancia(
                              titulo: '1.0 m',
                              distancia: 1,
                            ),
                            CustomButtonDistancia(
                              titulo: '2.0 m',
                              distancia: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: altura * 0.12,
                      //color: Colors.yellow,
                      child: Container(
                        child: CustomTextDados(
                          texto: 'Número de coletores',
                          action: TextInputAction.next,
                          icone: const Icon(Icons.schema),
                          controlador: _numeroColetores,
                          validator: (value) {
                            double controle;
                            String mensagem = 'Nº de Coletores inválidos';
                            if (value == "") {
                              return mensagem;
                            } else {
                              controle = double.parse(value!);
                              if (getEntrada.NDistancia == 0.5 &&
                                  (controle < 17 || controle > 88)) {
                                return mensagem;
                              } else if (getEntrada.NDistancia == 1.0 &&
                                  (controle < 11 || controle > 43)) {
                                return mensagem;
                              } else if (getEntrada.NDistancia == 2.0 &&
                                  (controle < 5 || controle > 23)) {
                                return mensagem;
                              }
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: altura * 0.15,
                      //color: Colors.yellow,
                      child: Container(
                        child: CustomTextDados(
                          texto: 'Número de passadas',
                          action: TextInputAction.done,
                          icone: const Icon(Icons.agriculture),
                          controlador: _numeroPassadas,
                          validator: (value) {
                            String mensagem = 'Nº de Passadas inválido';
                            if (_numeroPassadas.text == "") {
                              return mensagem;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      //color: Colors.blue,
                      child: SizedBox(
                        height: altura * 0.24,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 70),
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    int coletores =
                                        int.parse(_numeroColetores.text);
                                    int passadas =
                                        int.parse(_numeroPassadas.text);

                                    getEntrada.setNColetores(coletores);
                                    getEntrada.setNPassadas(passadas);

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ListaDadosScreen(
                                          itemCount: coletores,
                                        ),
                                      ),
                                    );
                                  } else if (_numeroPassadas.text.isEmpty) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          title: const Text(
                                              'Número de Passadas inválido'),
                                          content: const Text(
                                            'Informe o número de Passadas',
                                          ),
                                          actions: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          title: const Text(
                                              'Número de Coletores inválido'),
                                          content: getEntrada.NDistancia == 0.5
                                              ? const Text(
                                                  'Escolha o número de Coletores entre 17 e 88.',
                                                )
                                              : getEntrada.NDistancia == 1.0
                                                  ? const Text(
                                                      'Escolha o número de Coletores entre 11 e 43.\n\n',
                                                    )
                                                  : getEntrada.NDistancia == 2.0
                                                      ? const Text(
                                                          'Escolha o número de Coletores entre  5 e 23.\n\n',
                                                        )
                                                      : const Text(
                                                          'Falha',
                                                        ),
                                          actions: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                },
                                child: Text(
                                  'Calcular',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 14, 46, 39),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
