import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/widgets/popups/confirmation_popup.dart';
import 'package:vaccination_managment_app/widgets/popups/snackbars.dart';

bool _areDatesEqual(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

void selectVaccinePopup(
  BuildContext context,
  DateTime selectedDate,
  VaccineRecord selectedRecord,
  Future<void> Function() refresh,
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
          _areDatesEqual(
            selectedRecord.doseDates[selectedRecord.dose - 1],
            selectedDate,
          )
              ? TextButton(
                  child: Text(
                    'TAKEN',
                    style: buttonTextStyle,
                  ),
                  onPressed: () async {
                    final bool confirm = await confirmationPopup(
                      context,
                      "Confirm",
                      'Do you want to mark this dose as taken?',
                    );
                    if (confirm) {
                      try {
                        await db.updateVaccinationStatus(
                          selectedRecord.id,
                        );
                        await refresh();
                        if (!context.mounted) return;
                        Navigator.of(context).pop();
                        succesSnackBar(
                          context,
                          "Dose updated successfully!",
                        );
                      } catch (e) {
                        if (!context.mounted) return;
                        Navigator.of(context).pop();
                        failSnackBard(
                          context,
                          "Failed to update dose!",
                        );
                      }
                    }
                  },
                )
              : const SizedBox(),
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
