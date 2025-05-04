
import 'package:flutter/material.dart';

class CustomTableCellHeader extends StatelessWidget {
  const CustomTableCellHeader({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(child:   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Estedad",
              color: Colors.black),
        ),
      ),
    ),);
  }
}
