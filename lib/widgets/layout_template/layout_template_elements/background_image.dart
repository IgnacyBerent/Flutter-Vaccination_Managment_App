import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(
        'assets/background_image.png',
      ),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
