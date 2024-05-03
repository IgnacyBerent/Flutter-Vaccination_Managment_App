import 'dart:ui';

import 'package:flutter/material.dart';

class BlurEffect extends StatelessWidget {
  const BlurEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
        ),
      ),
    );
  }
}
