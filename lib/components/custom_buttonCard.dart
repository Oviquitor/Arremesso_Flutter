import 'package:flutter/material.dart';

class CustomButtonCard extends StatelessWidget {
  final String titulo;
  final String imagem;
  final VoidCallback onTap;
  final IconData icone;
  CustomButtonCard({
    super.key,
    required this.titulo,
    required this.imagem,
    required this.onTap,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width * 0.43,
      height: media.height * 0.23,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          splashColor: Colors.grey[300],
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Column(
            children: [
              Container(
                height: media.height * 0.05,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: media.height * 0.05,
                  width: media.width * 0.1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagem),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                height: media.height * 0.05,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontSize: media.height * 0.019,
                    fontWeight: FontWeight.bold,
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
