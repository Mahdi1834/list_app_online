import 'package:flutter/material.dart';

class TextFieldWithArrow extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const TextFieldWithArrow({
    super.key,
    required this.controller,
    required this.title,
  });

  void _increment() {
    // افزایش مقدار کنترلر
    final currentValue = int.tryParse(controller.text) ?? 0;
    controller.text = (currentValue + 1).toString();
  }

  void _decrement() {
    // کاهش مقدار کنترلر فقط اگر مقدار بزرگ‌تر از صفر باشد
    final currentValue = int.tryParse(controller.text) ?? 0;
    if (currentValue > 0) {
      controller.text = (currentValue - 1).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
          onPressed: _increment, // تابع افزایش مقدار
          icon: const Icon(Icons.keyboard_arrow_up_outlined),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          onPressed: _decrement, // تابع کاهش مقدار
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
        ),
      ],
    );
  }
}
