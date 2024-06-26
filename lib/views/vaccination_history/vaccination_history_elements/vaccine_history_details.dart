import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_elements/details_date_item.dart';
import 'package:vaccination_managment_app/widgets/popups/confirmation_popup.dart';

Future<void> vaccineHistoryDetails(
  BuildContext context,
  VaccineRecord vaccine,
  Future<void> Function() refresh,
) async {
  final db = DatabaseApi();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFFF8F8F8),
        title: Text(
          vaccine.name,
          style: popupTitleTextStyle,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Status: ${vaccine.status.name.toUpperCase()}',
              style: statusTextStyle,
            ),
            Text(
              'Doses:',
              style: statusTextStyle,
            ),
            for (var doseEntry in vaccine.doseDates.asMap().entries)
              DetailsDateItem(
                vaccineId: vaccine.id,
                vaccineDose: vaccine.dose,
                doseEntry: doseEntry,
                isCanceled: vaccine.status == VaccineStatus.canceled,
                prevDate: doseEntry.key == 0
                    ? null
                    : vaccine.doseDates[doseEntry.key - 1],
                nextDate: doseEntry.key == vaccine.doseDates.length - 1
                    ? null
                    : vaccine.doseDates[doseEntry.key + 1],
                refresh: refresh,
              )
          ],
        ),
        actions: [
          vaccine.status == VaccineStatus.canceled
              ? Container()
              : TextButton(
                  onPressed: () async {
                    final bool confirm = await confirmationPopup(
                      context,
                      "Confirm",
                      'Do you want to cancel this vaccine?',
                    );
                    if (confirm) {
                      await db.cancelVaccine(vaccine.id);
                      await refresh();
                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'CANCEL VACCINE',
                    style: buttonTextStyle,
                  ),
                ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'CLOSE',
              style: buttonTextStyle,
            ),
          ),
        ],
      );
    },
  );
}
