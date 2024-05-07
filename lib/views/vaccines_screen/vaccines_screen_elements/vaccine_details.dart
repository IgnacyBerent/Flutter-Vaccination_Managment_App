import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/mappings/obligation_status_text_map.dart';
import 'package:vaccination_managment_app/models/types/vaccine_interval_type.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/views/vaccines_screen/vaccines_screen_elements/add_vaccine_popup.dart';

void vaccineDetails(BuildContext context, Vaccine vaccine) async {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Type: ${vaccine.type}',
              style: descriptionTextStyle,
            ),
            Text(
              'Status: ${obligationStatusText[vaccine.obligation]}',
              style: descriptionTextStyle,
            ),
            Text(
              'Number of doses: ${vaccine.numberOfDoses}',
              style: descriptionTextStyle,
            ),
            vaccine.intervals == null ||
                    vaccine.intervalType == VaccineIntervalType.oneTime
                ? const Text('')
                : Text(
                    'Intervals: ${vaccine.intervals!.join(', ')}',
                    style: descriptionTextStyle,
                  ),
            vaccine.intervals == null ||
                    vaccine.intervalType == VaccineIntervalType.oneTime
                ? const Text('')
                : Text(
                    'Interval type: ${vaccine.intervalType.name}',
                    style: descriptionTextStyle,
                  ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              addVaccinePopup(context, vaccine.id);
            },
            child: Text(
              'SCHEDULE',
              style: buttonTextStyle,
            ),
          ),
          const SizedBox(width: 20),
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
