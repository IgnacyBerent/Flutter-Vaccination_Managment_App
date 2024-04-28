import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.onPressed,
    required this.text,
    required this.clicText,
  });

  final void Function() onPressed;
  final String text;
  final String clicText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.karla(
            color: const Color.fromARGB(255, 204, 231, 248),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(
                      255, 204, 231, 248), // Set the color of the underline
                  width: 1.5, // Set the thickness of the underline
                ),
              ),
            ),
            child: Text(
              clicText,
              style: GoogleFonts.karla(
                color: const Color.fromARGB(255, 204, 231, 248),
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
