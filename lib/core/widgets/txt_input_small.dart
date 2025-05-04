
import 'package:flutter/material.dart';


class TxtInputSmall extends StatelessWidget {
  const TxtInputSmall({
    super.key, required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      constraints: const BoxConstraints(
        maxWidth: 60,



      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey, // رنگ کادر
              width: 2.0, // ضخامت کادر
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey, // رنگ کادر در حالت غیر فعال
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey, // رنگ کادر در حالت فوکوس
              width: 2.0,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0), // فاصله افقی
        ),
        textAlignVertical: TextAlignVertical.center, // وسط‌چین عمودی
      ),
    );
  }
}
