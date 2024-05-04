import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';
import 'package:vaccination_managment_app/widgets/popups/confirmation_popup.dart';

class DetailsDateItem extends StatelessWidget {
  const DetailsDateItem({
    super.key,
    required this.vaccineId,
    required this.vaccineDose,
    required this.doseEntry,
    required this.isCanceled,
    this.prevDate,
    this.nextDate,
  });

  final int vaccineId;
  final int vaccineDose;
  final MapEntry<int, DateTime> doseEntry;
  final bool isCanceled;
  final DateTime? prevDate;
  final DateTime? nextDate;

  Color doseStatusColor(int doseNumber) {
    if (doseNumber < vaccineDose - 1) {
      return Colors.green;
    } else if (doseNumber == vaccineDose - 1) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  Future<void> updateDate(BuildContext context) async {
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
            'Do you want to update the date of this vaccine?',
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
                      firstDate: prevDate != null
                          ? prevDate!
                          : doseEntry.value.subtract(const Duration(days: 365)),
                      lastDate: nextDate != null
                          ? nextDate!
                          : doseEntry.value.add(const Duration(days: 365)),
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
                        await db.updateVaccinationDate(
                          vaccineId,
                          DateFormat('yyyy-MM-dd').format(doseEntry.value),
                          DateFormat('yyyy-MM-dd').format(pickedDate),
                        );
                        if (!context.mounted) return;
                        Navigator.of(context).pop();
                      }
                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                    }
                  },
                  height: 35,
                  width: 200,
                ),
                const SizedBox(height: 5),
                MyIconButton(
                  buttonText: "Done",
                  icon: Icons.done,
                  placement: "left",
                  onPressed: () {},
                  height: 35,
                  width: 200,
                ),
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: doseEntry.key >= vaccineDose - 1 && !isCanceled
          ? () => updateDate(context)
          : null,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0),
        ),
        margin: const EdgeInsets.only(top: 10.0),
        child: Text(
          '${doseEntry.key + 1}:   ${DateFormat('dd/MM/yyyy').format(doseEntry.value)}',
          style: GoogleFonts.karla(
            fontSize: 16,
            color: doseStatusColor(doseEntry.key),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
