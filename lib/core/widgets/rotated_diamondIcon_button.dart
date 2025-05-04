import 'package:flutter/material.dart';

class RotatedDiamondIconButton extends StatelessWidget {
  final String url;
  final String label;
  final VoidCallback onPressed;

  const RotatedDiamondIconButton({
    super.key,
    required this.url,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.33;
    return Transform.rotate(
      angle: 0.785398, // Rotate container for diamond shape
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: width,
          height: width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Transform.rotate(
            angle: -0.785398, // Keep contents upright
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Center(child: Image.asset(url))),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                    maxLines: 2, // Limit to one line
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}