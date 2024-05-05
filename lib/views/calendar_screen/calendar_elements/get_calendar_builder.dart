import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';

Color doseStatusColor(int doseNumber, int vaccineDose) {
  if (doseNumber < vaccineDose - 1) {
    return Colors.green;
  } else if (doseNumber == vaccineDose - 1) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

CalendarBuilders getCalendarBuilders(List<VaccineRecord> vaccineRecords) {
  return CalendarBuilders(
    markerBuilder: (context, date, events) {
      final record = vaccineRecords.firstWhere(
        (record) =>
            record.doseDates.any((doseDate) => isSameDay(doseDate, date)),
        orElse: () => VaccineRecord.asNull(),
      );

      if (record.id != -1) {
        final doseNumber = record.doseDates
            .indexWhere((doseDate) => isSameDay(doseDate, date));
        final color = doseStatusColor(doseNumber, record.dose);

        return Container(
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.only(top: 9.0, left: 8.0),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          width: 90,
          height: 90,
          child: Text(
            '${date.day}',
            style: descriptionTextStyle.copyWith(
              color: Colors.white,
            ),
          ),
        );
      }

      return null;
    },
  );
}
