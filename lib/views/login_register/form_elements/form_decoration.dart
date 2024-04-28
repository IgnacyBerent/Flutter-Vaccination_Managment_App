import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FormDecoration extends StatelessWidget {
  const FormDecoration({super.key, required this.iconData, required this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: const Color(0xFF2F4858),
          size: 18,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: GoogleFonts.karla(
            color: const Color(0xFF2F4858),
            fontSize: 11,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
