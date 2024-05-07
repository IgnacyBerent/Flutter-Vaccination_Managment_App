import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';

void failSnackBard(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(255, 221, 0, 85),
      content: Text(
        message,
        style: descriptionTextStyle,
      ),
    ),
  );
}

void succesSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(255, 0, 236, 162),
      content: Text(
        message,
        style: descriptionTextStyle,
      ),
    ),
  );
}
