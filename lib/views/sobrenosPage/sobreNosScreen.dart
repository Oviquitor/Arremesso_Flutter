import 'package:farm/views/MenuPage/NavigationBar.dart';
import 'package:farm/views/SobreNosPage/components/termosDeUsoScreen.dart';
import 'package:farm/views/SobreNosPage/components/textBottonSobre.dart';
import 'package:flutter/material.dart';

class SobreNosScreen extends StatefulWidget {
  const SobreNosScreen({super.key});

  @override
  State<SobreNosScreen> createState() => _SobreNosScreenState();
}

class _SobreNosScreenState extends State<SobreNosScreen> {
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
        title: Container(
          height: size.height * 0.15,
          width: size.width * 0.35,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/AgriDecode1.png"),
            ),
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
                  'Objetivos',
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
                    text:
                        'Nosso objetivo é ser lider no mercado de tecnologia agrícola, '
                        'fornecendo soluções inovadoras que ajudem a aumentar a eficiência '
                        'e a produtividade dos agrônomos no campo. Buscamos constantemente '
                        'novas tecnologias e ferramentas para atender às necessidades do '
                        'agronegócio e garantir a qualidade e sustentabilidade dos cultivos.',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.33),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Saiba mais',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
              TextBottonSobre(
                link: 'https://agridecode.com/sobre-nos',
                title: 'Sobre nós',
                icone: Icons.assignment,
                onTap: () {},
              ),
              TextBottonSobre(
                link: '',
                title: 'Termos de uso',
                icone: Icons.message,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TermosUsoScreen(),
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
