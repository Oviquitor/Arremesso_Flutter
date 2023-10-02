import 'package:flutter/material.dart';

class TelaScreen extends StatelessWidget {
  TelaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Count1(),
          Count2(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: TelaScreenPresenter().incrementNumero,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TelaScreenPresenter {
  TelaScreenPresenter._private();
  static TelaScreenPresenter instance = TelaScreenPresenter._private();
  factory TelaScreenPresenter() {
    return instance;
  }

  ValueNotifier<int> valor = ValueNotifier(0);
  void incrementNumero() {
    valor.value += 1;
  }
}

class Count1 extends StatelessWidget {
  Count1({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TelaScreenPresenter().valor,
      builder: (context, value, child) => Text(
        "$value",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Count2 extends StatelessWidget {
  Count2({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TelaScreenPresenter().valor,
      builder: (context, value, child) => Text(
        "$value",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
