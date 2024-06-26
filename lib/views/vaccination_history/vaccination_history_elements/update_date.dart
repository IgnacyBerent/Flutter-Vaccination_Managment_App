import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';
import 'package:vaccination_managment_app/widgets/popups/confirmation_popup.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/widgets/popups/snackbars.dart';

Future<void> updateDate({
  required BuildContext context,
  required int vaccineId,
  required int vaccineDose,
  required MapEntry<int, DateTime> doseEntry,
  DateTime? prevDate,
  DateTime? nextDate,
  required Future<void> Function() refresh,
}) async {
  final db = DatabaseApi();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Update Date',
          style: popupTextStyle,
        ),
        content: Text(
          'Do you want to update the vaccination?',
          style: descriptionTextStyle,
        ),
        actionsAlignment: MainAxisAlignment.center,
        alignment: Alignment.center,
        actions: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MyIconButton(
                buttonText: "Reshedule",
                icon: Icons.calendar_today,
                placement: "left",
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: doseEntry.value,
                    firstDate: prevDate ??
                        doseEntry.value.subtract(const Duration(days: 365)),
                    lastDate: nextDate ??
                        doseEntry.value.add(const Duration(days: 365)),
                  );

                  if (pickedDate != null) {
                    if (!context.mounted) return;
                    final formatedDate =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
                    final bool confirm = await confirmationPopup(
                      context,
                      "Confirm",
                      'Do you want to update the vaccine date to $formatedDate?',
                    );

                    if (confirm) {
                      try {
                        await db.rescheduleVaccinationDate(
                          vaccineId,
                          DateFormat('yyyy-MM-dd').format(doseEntry.value),
                          DateFormat('yyyy-MM-dd').format(pickedDate),
                        );
                        await refresh();
                        if (!context.mounted) return;
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        succesSnackBar(
                          context,
                          "Reshedule vaccinate successfull!",
                        );
                      } catch (e) {
                        if (!context.mounted) return;
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        failSnackBard(
                          context,
                          "Failed to Reshedule vaccination!",
                        );
                      }
                    }
                  }
                },
                height: 35,
                width: 200,
              ),
              const SizedBox(height: 5),
              doseEntry.key == vaccineDose - 1
                  ? MyIconButton(
                      buttonText: "Taken",
                      icon: Icons.done,
                      placement: "left",
                      onPressed: () async {
                        final bool confirm = await confirmationPopup(
                          context,
                          "Confirm",
                          'Do you want to mark this dose as taken?',
                        );
                        if (confirm) {
                          try {
                            await db.updateVaccinationStatus(
                              vaccineId,
                            );
                            await refresh();
                            if (!context.mounted) return;
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            succesSnackBar(
                              context,
                              "Dose updated successfully!",
                            );
                          } catch (e) {
                            if (!context.mounted) return;
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            failSnackBard(
                              context,
                              "Failed to update dose!",
                            );
                          }
                        }
                      },
                      height: 35,
                      width: 200,
                    )
                  : const SizedBox(),
              const SizedBox(height: 5),
              MyIconButton(
                buttonText: "Cancel",
                icon: Icons.cancel,
                placement: "left",
                onPressed: () {
                  Navigator.of(context).pop();
                },
                height: 35,
                width: 200,
              ),
            ],
          ),
        ],
      );
    },
  );
}
