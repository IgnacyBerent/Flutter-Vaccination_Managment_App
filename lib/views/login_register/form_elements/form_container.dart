import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination_managment_app/views/login_register/form_elements/form_decoration.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
    required this.text,
    required this.icon,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.controller,
  });

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String text;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconButton? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormDecoration(
          iconData: icon,
          text: text,
        ),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Stack(
            children: [
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                  border: InputBorder.none,
                  suffixIcon: suffixIcon,
                ),
                keyboardType: keyboardType ?? TextInputType.text,
                validator: validator,
                onSaved: onSaved,
                obscureText: obscureText,
                style: obscureText
                    ? const TextStyle(
                        color: Color(0xFF2F4858),
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      )
                    : GoogleFonts.karla(
                        color: const Color(0xFF2F4858),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 3.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xBF2F4858),
                        Color(0xFF00AAA0),
                        Color(0xBF2F4858),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
