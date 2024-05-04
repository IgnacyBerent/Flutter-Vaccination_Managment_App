import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';

void addVaccinePopup(BuildContext context, int id) {
  final db = DatabaseApi();
  final TextEditingController controller = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Schedule Vaccine',
          style: popupTextStyle,
        ),
        content: TextField(
          controller: controller,
          style: descriptionTextStyle,
          decoration: InputDecoration(
            labelText: 'dd/MM/yyyy',
            labelStyle: descriptionTextStyle,
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (pickedDate != null) {
                  controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                }
              },
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'CANCEL',
              style: buttonTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'SUBMIT',
              style: buttonTextStyle,
            ),
            onPressed: () async {
              final inputDate = DateFormat('yyyy-MM-dd').format(
                DateFormat('dd/MM/yyyy').parse(controller.text),
              );
              try {
                await db.addVaccineRecord(id, inputDate);
                if (!context.mounted) return;
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Vaccine added successfully!',
                      style: descriptionTextStyle,
                    ),
                  ),
                );
              } catch (e) {
                if (!context.mounted) return;
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Failed to add vaccine!',
                      style: descriptionTextStyle,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      );
    },
  );
}
