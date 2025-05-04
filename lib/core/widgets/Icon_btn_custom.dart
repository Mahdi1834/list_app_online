
import 'package:flutter/material.dart';



class IconBtnCustom extends StatelessWidget {
  const IconBtnCustom({
    super.key,
    required this.pressed,
  });

  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius:
          const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: Colors.green, width: 1.5)),
      child: IconButton(
        onPressed:pressed,
        icon: const Icon(
          Icons.check,
          size: 10,
          color: Colors.green,
        ),
      ),
    );
  }
}
