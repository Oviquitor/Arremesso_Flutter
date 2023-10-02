import 'package:flutter/material.dart';

class TermosUsoScreen extends StatelessWidget {
  const TermosUsoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          'Termos de Uso',
          style: TextStyle(
            color: Color.fromARGB(255, 22, 71, 61),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                child: const Text(
                  'Nossos termos de uso',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: '1. Aceitação dos Termos de Uso\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        'Ao fazer o download, instalar, acessar ou usar o aplicativo [Nome do Aplicativo] ("Aplicativo"), você concorda em cumprir estes Termos de Uso ("Termos"). Se você não concordar com esses Termos, não use o aplicativo.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: '2. Uso do Aplicativo\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '2.1. O [Nome do Aplicativo] é uma ferramenta destinada a profissionais agrônomos para [descrição das principais funcionalidades e objetivos do aplicativo].\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '2.2. Você é responsável por qualquer uso do aplicativo e deve cumprir todas as leis e regulamentos aplicáveis.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: '3. Conta de Usuário\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '3.1. Você pode ser obrigado a criar uma conta de usuário para acessar determinadas partes do aplicativo. Você concorda em fornecer informações precisas e atualizadas ao criar sua conta.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '3.2. Você é responsável por manter a confidencialidade de suas informações de login e por todas as atividades que ocorram em sua conta.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '4.1. O uso do aplicativo está sujeito à nossa Política de Privacidade, que pode ser encontrada em [URL da Política de Privacidade]. Ao usar o aplicativo, você concorda com a coleta e o uso de suas informações de acordo com a Política de Privacidade.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: '5. Propriedade Intelectual\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '5.1. Todos os direitos autorais, marcas registradas, segredos comerciais e outros direitos de propriedade intelectual relacionados ao aplicativo pertencem a [Nome da Empresa] ou a terceiros licenciadores.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: '6. Responsabilidade\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '6.1. O [Nome da Empresa] não é responsável por quaisquer danos diretos, indiretos, incidentais, especiais ou consequentes decorrentes do uso ou da incapacidade de usar o aplicativo.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '6.2. Você concorda em isentar o [Nome da Empresa] de qualquer responsabilidade por qualquer conteúdo ou ação de terceiros.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: '7. Alterações nos Termos\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '7.1. Podemos atualizar ou modificar estes Termos periodicamente. Quaisquer alterações serão publicadas nesta página. Recomendamos que você reveja regularmente os Termos de Uso.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: '8. Rescisão\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '8.1. Podemos encerrar ou suspender sua conta ou acesso ao aplicativo a qualquer momento, por qualquer motivo, sem aviso prévio.\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: '9. Lei Aplicável e Jurisdição\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '9.1. Estes Termos são regidos e interpretados de acordo com as leis do [País ou Estado]. Qualquer disputa relacionada a estes Termos será de competência exclusiva dos tribunais do [País ou Estado].\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: '10. Contato\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text:
                        '10.1. Se você tiver alguma dúvida ou preocupação sobre estes Termos, entre em contato conosco em [Endereço de Contato].\n\n',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
