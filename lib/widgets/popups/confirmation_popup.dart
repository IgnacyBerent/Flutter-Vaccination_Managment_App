import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';

Future<bool> confirmationPopup(
  BuildContext context,
  String title,
  String description,
) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: popupTextStyle,
        ),
        content: Text(
          description,
          style: descriptionTextStyle,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'CANCEL',
              style: buttonTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text(
              'CONFIRM',
              style: buttonTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
