import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyIconButton extends StatelessWidget {
  final String buttonText;
  final Icon icon;
  final String placement;
  final VoidCallback onPressed;
  final bool isLoading;

  const MyIconButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.placement,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  placement == 'left' ? icon : const SizedBox(),
                  const SizedBox(width: 10),
                  Text(
                    buttonText,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  placement == 'right' ? icon : const SizedBox(),
                ],
              ),
      ),
    );
  }
}
