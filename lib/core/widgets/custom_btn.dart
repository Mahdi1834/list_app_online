import 'package:flutter/material.dart';
class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,

    required this.onPress, required this.title,this.color = Colors.orange,
  });


  final VoidCallback onPress;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPress,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
