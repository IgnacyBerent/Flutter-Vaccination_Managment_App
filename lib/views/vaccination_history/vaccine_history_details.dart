import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            vaccine.status == Status.done
                ? Text('Next dose: ${vaccine.nextDose}')
                : const SizedBox(),
            const Text('Doses:'),
            for (var doseEntry in vaccine.doses.asMap().entries)
              doseEntry.value != null
                  ? Text(
                      '${doseEntry.key + 1}: ${DateFormat('dd/MM/yyyy').format(doseEntry.value!)}',
                      style: TextStyle(
                        fontSize: 14,
                        // if already taken show in green
                        color: DateTime.now().isAfter(doseEntry.value!)
                            ? Colors.green
                            : null,
                      ),
                    )
                  : Text('${doseEntry.key + 1}: Not added yet'),
          ],
        ),
        actions: [
          vaccine.status == Status.done
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
