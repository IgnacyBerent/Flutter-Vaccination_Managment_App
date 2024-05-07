import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_elements/update_date.dart';

class DetailsDateItem extends StatelessWidget {
  const DetailsDateItem({
    super.key,
    required this.vaccineId,
    required this.vaccineDose,
    required this.doseEntry,
    required this.isCanceled,
    this.prevDate,
    this.nextDate,
    required this.refresh,
  });

  final int vaccineId;
  final int vaccineDose;
  final MapEntry<int, DateTime> doseEntry;
  final bool isCanceled;
  final DateTime? prevDate;
  final DateTime? nextDate;
  final Future<void> Function() refresh;

  Color doseStatusColor(int doseNumber) {
    if (doseNumber < vaccineDose - 1) {
      return const Color.fromARGB(255, 0, 236, 162);
    } else if (doseNumber == vaccineDose - 1) {
      return const Color.fromARGB(255, 221, 133, 0);
    } else {
      return const Color.fromARGB(255, 221, 0, 85);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: doseEntry.key >= vaccineDose - 1 && !isCanceled
          ? () => updateDate(
                context: context,
                vaccineId: vaccineId,
                vaccineDose: vaccineDose,
                doseEntry: doseEntry,
                prevDate: prevDate,
                nextDate: nextDate,
                refresh: refresh,
              )
          : null,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(50, 255, 255, 255),
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
