import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextDados extends StatelessWidget {
  final TextEditingController controlador;
  final FormFieldValidator<String> validator;
  final String texto;
  final Icon icone;
  final TextInputAction action;

  CustomTextDados(
      {super.key,
      required this.validator,
      required this.controlador,
      required this.texto,
      required this.icone,
      required this.action,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: controlador,
      textInputAction: action,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: icone,
        labelText: texto,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
