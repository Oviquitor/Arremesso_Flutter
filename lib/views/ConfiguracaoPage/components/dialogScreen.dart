import 'package:flutter/material.dart';

class DialogScreen extends StatelessWidget {
  DialogScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Positioned(
            top: 200,
            left: 4,
            right: 4,
            child: Card(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Fechar'),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
