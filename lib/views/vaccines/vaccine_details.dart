import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';

void vaccineDetails(BuildContext context, Vaccine vaccine) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(vaccine.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Type: ${vaccine.type}'),
            Text('Status: ${vaccine.obligation.name}'),
            Text('Number of doses: ${vaccine.numberOfDoses}'),
            vaccine.intervals == null
                ? const Text('Interval: -')
                : Text('Intervals: ${vaccine.intervals!.join(', ')}'),
            Text('Interval type: ${vaccine.intervalType.name}'),
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
