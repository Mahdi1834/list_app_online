import 'package:flutter/material.dart';

class ImageWithTitle extends StatelessWidget {
  const ImageWithTitle({
    super.key, required this.imageUrl, required this.title,this.percent = 0.2, required this.onPress

  });

  final String imageUrl;
  final String title;
  final double percent;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPress ,
      child: Column(
        children: [

          Image.asset(
          imageUrl,
            width: width * percent,
            height: width * percent,
          ),
          Text(title , style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}