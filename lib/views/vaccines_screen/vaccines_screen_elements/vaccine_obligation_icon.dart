import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VaccineObligationIcon extends StatelessWidget {
  const VaccineObligationIcon({
    super.key,
    required this.letter,
    required this.statusColor,
  });

  final String letter;
  final Color statusColor;

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
          width: 60,
          height: 60,
          child: Center(
            child: Text(
              letter,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 204, 231, 248),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
