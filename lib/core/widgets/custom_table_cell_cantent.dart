
import 'package:flutter/material.dart';

class CustomTableCellContent extends StatelessWidget {
  const CustomTableCellContent({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TableCell(child:   Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: "Estedad",
                color:Colors.black),
          ),
        ),
      ),
    ),);
  }
}


class CustomTableCellContentIcon extends StatelessWidget {
  const CustomTableCellContentIcon({
    super.key, required this.icon, required this.onTap, required this.color,
  });
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TableCell(child:   Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Icon(icon, color: color,),
        ),
      ),
    ),);
  }
}




class CustomTableContent extends StatelessWidget {
  const CustomTableContent({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 14,
              fontFamily: "Estedad",
              color:Colors.black),
        ),
      ),
    );
  }
}
