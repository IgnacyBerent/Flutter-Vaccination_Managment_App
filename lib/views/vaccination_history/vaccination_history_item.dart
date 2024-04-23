import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination_managment_app/models/mappings/vaccine_status_icon_map.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccine_history_details.dart';

class VaccineHistoryItem extends StatelessWidget {
  final VaccineRecord vaccine;

  const VaccineHistoryItem(this.vaccine, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.only(bottom: 15),
      shadowColor: Colors.black,
      elevation: 5,
      child: InkWell(
        onTap: () {
          vaccineHistoryDetails(context, vaccine);
        },
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: vaccineStatusIconMap[vaccine.status] as Icon,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vaccine.name,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  vaccine.status == VaccineStatus.pending
                      ? 'Next dose in: \n ${vaccine.doseDates[vaccine.dose - 1].difference(DateTime.now()).inDays} days'
                      : 'Status: ${vaccine.status.name}',
                  style: GoogleFonts.karla(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
