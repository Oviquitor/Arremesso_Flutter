import 'package:flutter/material.dart';

class TextBottonConfiguracao extends StatelessWidget {
  final String title;
  final IconData icone;
  final VoidCallback onTap;

  TextBottonConfiguracao({
    super.key,
    required this.title,
    required this.icone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(icone),
            ),
            Expanded(
              flex: 8,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[500],
            ),
          ],
        ),
      ),
    );
  }
}
