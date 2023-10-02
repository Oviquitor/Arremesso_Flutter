import 'package:farm/models/EntradaModel.dart';
import 'package:farm/stores/Resultado.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomButtonDistancia extends StatefulWidget {
  final String titulo;
  final double distancia;

  CustomButtonDistancia({
    super.key,
    required this.distancia,
    required this.titulo,
  });

  @override
  State<CustomButtonDistancia> createState() => _CustomButtonDistanciaState();
}

class _CustomButtonDistanciaState extends State<CustomButtonDistancia> {
  var getEntrada = GetIt.I<EntradaModel>();

  var getResultado = GetIt.I<Resultado>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return OutlinedButton(
      onPressed: () {
        getEntrada.setNDistancia(widget.distancia);
        getResultado.NDistancia = widget.distancia;
      },
      child: Text(
        widget.titulo,
        style: TextStyle(
          fontSize: size.height * 0.020,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 2.5,
          color: Color.fromARGB(255, 22, 71, 61),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
