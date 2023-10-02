import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ManualScreen extends StatefulWidget {
  const ManualScreen({super.key});

  @override
  State<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
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
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 22, 71, 61),
        ),
        centerTitle: true,
        title: Text(
          'Manual',
          style: TextStyle(
            color: Color.fromARGB(255, 22, 71, 61),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: availableHeight * 0.85,
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 25, top: 25),
                              child: Text(
                                'Como Realizar o Cálculo',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.justify,
                              text: const TextSpan(
                                text:
                                    'Na tela de entrada de dados inicial, existem dois campos que devem ser '
                                    'preenchidos, sendo eles o número de coletores que será utilizado no teste, '
                                    'o número de vezes que a máquina irá passar e deverá ser selecionada a distância '
                                    'entre os coletores.Após apertar o botãoCalcular, que redireciona para a próxima '
                                    'página, onde, deverá ser informada a pesagem do produto, em gramas, de cada '
                                    'bandeja. Por fim aperte o botão no canto inferior direito para enviar os dados.',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 25, top: 25),
                              child: Text(
                                'Visualização dos Dados',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.justify,
                              text: const TextSpan(
                                text:
                                    'Para a visualização dos dados, o aplicativo oferece duas opções, '
                                    'sendo elas um histograma com a pesagem de cada bandeja, e uma tabela '
                                    'com o valor de porcentagem do Coeficiente de Variação (CV%) dos lados esquerdo e direito. \n\n'
                                    'Para acessar as opções de visualização, o usuário pode: \n\n'
                                    '- Ser redirecionado para a tela após o envio de novos dados para serem calculados;  \n\n'
                                    '- Por meio do botão de “Relatórios” na página principal, que utiliza os últimos dados enviados para a visualização; \n\n'
                                    '- Utilizando a página de históricos de cálculos, que pode ser acessada utilizando o botão da direita na parte inferior do '
                                    'menu, e ao expandir a visualização do histórico existem botões que podem ser pressionados para redirecionar para a visualização desejada.',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 25, top: 25),
                              child: Text(
                                'Análise de Resultados',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.justify,
                              text: const TextSpan(
                                text:
                                    'Dentre as duas opções de visualização de dados, o histograma traz a visualização da pesagem '
                                    'por bandeja do teste, que possibilita a checagem de uma distribuição mais simétrica do produto. '
                                    'A tabela traz os dados do CV% de ambos os lados para a distribuição.',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: availableHeight * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 22, 71, 61),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Color.fromARGB(255, 22, 71, 61)
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 22, 71, 61),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
