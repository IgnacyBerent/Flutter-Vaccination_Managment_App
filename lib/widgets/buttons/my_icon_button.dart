import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyIconButton extends StatelessWidget {
  final String buttonText;
  final Icon icon;
  final String placement;
  final VoidCallback onPressed;
  final bool isLoading;
  final double width;
  final double height;

  const MyIconButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.placement,
    required this.onPressed,
    this.isLoading = false,
    this.width = 170,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
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
