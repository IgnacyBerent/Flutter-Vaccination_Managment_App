import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination_managment_app/models/mappings/vaccine_obligation_icon_map.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';
import 'package:vaccination_managment_app/views/vaccines/vaccine_details.dart';

class VaccineItem extends StatelessWidget {
  final Vaccine vaccine;

  const VaccineItem(this.vaccine, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        vaccineDetails(context, vaccine);
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
              child: vaccineObligationIconMap[vaccine.obligation] as Icon,
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
