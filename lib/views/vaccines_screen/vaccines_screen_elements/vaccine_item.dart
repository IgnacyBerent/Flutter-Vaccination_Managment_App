import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination_managment_app/models/mappings/vaccine_obligation_icon_map.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';
import 'package:vaccination_managment_app/views/vaccines_screen/vaccines_screen_elements/vaccine_details.dart';

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
          color: const Color.fromARGB(40, 255, 255, 255),
          shadowColor: Colors.black54,
          elevation: 5,
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
                  color: const Color(0xFFF8F8F8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
