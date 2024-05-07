import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';

void infoPopup(BuildContext context, String title, String description) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: const Color(0xFFF8F8F8),
      title: Text(
        'Login Failed',
        style: popupTextStyle,
      ),
      content: Text(
        description,
        style: descriptionTextStyle,
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Okay',
            style: buttonTextStyle,
          ),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        ),
      ],
    ),
  );
}
