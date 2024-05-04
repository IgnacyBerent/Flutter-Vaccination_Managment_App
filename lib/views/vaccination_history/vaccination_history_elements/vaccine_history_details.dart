import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_elements/details_date_item.dart';

Future<void> vaccineHistoryDetails(
  BuildContext context,
  VaccineRecord vaccine,
  Function onCancel,
) async {
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
              )
          ],
        ),
        actions: [
          vaccine.status == VaccineStatus.canceled
              ? Container()
              : TextButton(
                  onPressed: () {
                    onCancel;
                    Navigator.of(context).pop();
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
