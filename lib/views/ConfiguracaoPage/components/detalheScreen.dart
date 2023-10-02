import 'package:farm/stores/EventoGeral.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class DetalheScreen extends StatelessWidget {
  const DetalheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var getEvento = GetIt.I<EventoGeral>();

    String dateString = getEvento.usuario[0]['CreationTime'];
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    final PreferredSizeWidget appBar = AppBar();
    final size = MediaQuery.of(context).size;
    final altura = size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes da Conta',
          style: TextStyle(color: Color.fromARGB(255, 14, 46, 39)),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 14, 46, 39)),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: altura * 0.04),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: altura * 0.02)),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 0, 0, 0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(getEvento.usuario[0]['PhotoURL']),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: altura * 0.030, vertical: altura * 0.045),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                      'Veja aqui suas informações de acesso à conta Arremesso',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: altura * 0.05),
              child: const Text(
                'Nome',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                getEvento.usuario[0]['DisplayName'],
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: altura * 0.05),
              child: const Text(
                'Email',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                getEvento.usuario[0]['Email'],
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: altura * 0.05),
              child: const Text(
                'Criado em',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
