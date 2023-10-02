import 'package:flutter/material.dart';

class CustomButtonReport extends StatelessWidget {
  final String titulo;
  final String imagem;
  final VoidCallback onTap;
  final IconData icone;
  CustomButtonReport(
      {super.key,
      required this.titulo,
      required this.imagem,
      required this.onTap,
      required this.icone});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: media.width * 0.3,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
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
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    titulo,
                    style: TextStyle(
                      fontSize: media.height * 0.019,
                      fontWeight: FontWeight.bold,
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
