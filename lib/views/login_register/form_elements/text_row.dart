import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.onPressed,
    required this.text,
    required this.clicText,
    required this.color,
  });

  final void Function() onPressed;
  final String text;
  final String clicText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.karla(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: color,
                  width: 1.5,
                ),
              ),
            ),
            child: Text(
              clicText,
              style: GoogleFonts.karla(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
