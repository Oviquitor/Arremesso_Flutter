import 'package:flutter/material.dart';


class ListCards extends StatefulWidget {
  final int itemCount;
  const ListCards({super.key, required this.itemCount});

  @override
  State<ListCards> createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resultados',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: widget.itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.check),
              title: Text('Item ${index + 1}'),
              subtitle: Text('Descrição do item ${index + 1}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // código a ser executado quando o card for clicado
              },
            ),
          );
        },
      ),
    );
  }
}
