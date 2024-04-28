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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: const Color.fromARGB(19, 255, 255, 255),
          margin: const EdgeInsets.only(bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              vaccineObligationIconMap[vaccine.obligation],
              Text(
                vaccine.name,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
