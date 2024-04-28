import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination_managment_app/models/mappings/obligation_status_text_map.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';
import 'package:vaccination_managment_app/views/vaccines/add_vaccine_popup.dart';

void vaccineDetails(BuildContext context, Vaccine vaccine) async {
  final descriptionTextStyle = GoogleFonts.karla(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  final buttonTextStyle = GoogleFonts.karla(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF00CB94),
  );

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 204, 231, 248),
        title: Text(
          vaccine.name,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
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
            vaccine.intervals == null
                ? const Text('')
                : Text(
                    'Intervals: ${vaccine.intervals!.join(', ')}',
                    style: descriptionTextStyle,
                  ),
            vaccine.intervals == null
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
