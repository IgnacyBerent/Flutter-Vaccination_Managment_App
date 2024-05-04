import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusIcon extends StatelessWidget {
  const StatusIcon({
    super.key,
    required this.letter,
    required this.statusColor,
    required this.size,
    required this.fontSize,
  });

  final String letter;
  final Color statusColor;
  final double size;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10000),
        color: statusColor,
      ),
      child: ClipOval(
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Text(
              letter,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 204, 231, 248),
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
