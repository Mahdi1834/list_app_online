import 'package:flutter/material.dart';

class TxtError extends StatelessWidget {
  const TxtError({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Text( text , style: TextStyle(color: Colors.red , fontSize: 20 , fontWeight: FontWeight.bold), );
  }
}
