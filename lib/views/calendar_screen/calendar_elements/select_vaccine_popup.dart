import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/widgets/popups/confirmation_popup.dart';

void selectVaccinePopup(
  BuildContext context,
  DateTime selectedDate,
  VaccineRecord selectedRecord,
) {
  final db = DatabaseApi();
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
            onPressed: () async {
              int doseIndex = selectedRecord.dose - 1;
              if (selectedRecord.doseDates[doseIndex] == selectedDate) {
                final bool confirm = await confirmationPopup(
                  context,
                  "Confirm",
                  'Do you want to mark this dose as taken?',
                );
                if (confirm) {
                  await db.updateVaccinationStatus(
                    selectedRecord.id,
                    selectedRecord.dose,
                  );
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                }
              }
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
