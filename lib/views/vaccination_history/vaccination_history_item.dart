import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccine_history_details.dart';

class VaccineHistoryItem extends StatelessWidget {
  final VaccineRecord vaccine;

  const VaccineHistoryItem(this.vaccine, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        vaccineHistoryDetails(context, vaccine);
      },
      child: Card(
        color: Colors.grey[200],
        margin: const EdgeInsets.only(bottom: 15),
        shadowColor: Colors.black,
        elevation: 5,
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: Icon(
                size: 40,
                vaccine.status == Status.done ? Icons.done : Icons.info,
                color: vaccine.status == Status.done
                    ? Colors.green
                    : Colors.orange,
              ),
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
                  vaccine.type,
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
