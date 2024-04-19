import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';

void vaccineHistoryDetails(BuildContext context, VaccineRecord vaccine) async {
  final dateFormat = DateFormat('dd-MM-yyyy');
  final formattedDate = dateFormat.format(vaccine.doseDates[vaccine.dose]);

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(vaccine.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Status: ${vaccine.status.name}'),
            vaccine.status != VaccineStatus.done
                ? Text('Next dose at: $formattedDate')
                : const SizedBox(),
            const Text('Doses:'),
            for (var doseEntry in vaccine.doseDates.asMap().entries)
              Text(
                '${doseEntry.key + 1}: ${DateFormat('dd/MM/yyyy').format(doseEntry.value)}',
                style: TextStyle(
                  fontSize: 14,
                  color: DateTime.now().isAfter(doseEntry.value)
                      ? Colors.green
                      : null,
                ),
              ),
          ],
        ),
        actions: [
          vaccine.status == VaccineStatus.done
              ? const SizedBox()
              : TextButton(
                  onPressed: () {
                    //TODO: add to calendar
                  },
                  child: const Text('AdD to calendar'),
                ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
