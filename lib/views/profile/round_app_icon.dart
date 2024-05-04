import 'package:flutter/material.dart';

class RoundAppIcon extends StatelessWidget {
  const RoundAppIcon({
    super.key,
    required this.imagePath,
    required this.borderColor,
    this.size = 150,
  });

  final String imagePath;
  final Color borderColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
