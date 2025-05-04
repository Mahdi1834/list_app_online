import 'package:flutter/material.dart';

class IconButtonWithTitle extends StatelessWidget {
  const IconButtonWithTitle({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon = Icons.refresh_rounded
  });

  final String title;
  final VoidCallback onPressed;
  final IconData icon ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
   title,
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 40,
            ))
      ],
    );
  }
}


