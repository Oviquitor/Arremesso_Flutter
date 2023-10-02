import 'package:farm/views/SuportePage/components/textBottonSuporte.dart';
import 'package:flutter/material.dart';

class SuporteScreen extends StatefulWidget {
  SuporteScreen({super.key});

  @override
  State<SuporteScreen> createState() => _SuporteScreenState();
}

class _SuporteScreenState extends State<SuporteScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 22, 71, 61),
        ),
        centerTitle: true,
        title: const Text(
          'Suporte',
          style: TextStyle(
            color: Color.fromARGB(255, 22, 71, 61),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                    child: const Text(
                      'Precisa de Ajuda?',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  TextBottonSuporte(
                    link: 'mailto:',
                    title: 'Nos mande um E-mail',
                    subtitle:
                        'Caso tenha algum problema ou sugestão para o aplicativo, por favor, ' +
                            'envie-nos um e-mail. Responderemos o mais rápido possível! \ndesenvolvimento@agridecode.com',
                    icone: Icons.email_outlined,
                  ),
                  TextBottonSuporte(
                    link: 'https://www.instagram.com/agridecode/',
                    title: 'Instagram',
                    subtitle:
                        'Quer se manter atualizado? Siga-nos no Instagram! Estamos em contato constante com nosso público, ' +
                            'compartilhando atualizações e novas funcionalidades do nosso aplicativo \n@agridecode',
                    icone: Icons.camera_alt_outlined,
                  ),
                  TextBottonSuporte(
                    link: 'https://agridecode.com',
                    title: 'Acesse ao nosso Site',
                    subtitle:
                        'Para obter mais informações sobre nossos serviços e conhecer um pouco mais sobre nossa história, ' +
                            'convidamos você a visitar nosso site \nagridecode.com',
                    icone: Icons.public,
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
