import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';

void vaccineHistoryDetails(BuildContext context, VaccineRecord vaccine) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(vaccine.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Type: ${vaccine.type}'),
            Text('Status: ${vaccine.status.name}'),
            Text('Number of doses: ${vaccine.numberOfDoses}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // add to calendar
            },
            child: const Text('Add to calendar'),
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
