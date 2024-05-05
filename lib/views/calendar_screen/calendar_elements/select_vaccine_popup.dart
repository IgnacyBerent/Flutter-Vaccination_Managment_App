import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';

void selectVaccinePopup(
  BuildContext context,
  DateTime selectedDate,
  VaccineRecord selectedRecord,
) {
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          selectedRecord.name,
          style: popupTitleTextStyle,
        ),
        content: Text(
          'Dose: ${formatter.format(selectedDate)}',
          style: descriptionTextStyle,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'TAKEN',
              style: buttonTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'OK',
              style: buttonTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
