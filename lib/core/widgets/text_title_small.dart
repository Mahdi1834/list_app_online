import 'package:flutter/material.dart';

class TextTitleSmall extends StatelessWidget {
  const TextTitleSmall({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: textTheme.titleSmall,
      textAlign: TextAlign.end,

    );
  }
}