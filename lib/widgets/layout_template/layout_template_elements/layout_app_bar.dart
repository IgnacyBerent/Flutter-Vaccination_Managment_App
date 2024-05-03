import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LayoutAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 22,
          fontWeight: FontWeight.w900,
          color: const Color(0xFF2F4858),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
