import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';

class VaccineItem extends StatelessWidget {
  final Vaccine vaccine;

  const VaccineItem(this.vaccine, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // show info about dosage and buttons to add to calendar
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(vaccine.name),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Type: ${vaccine.type}'),
                  Text('Status: ${vaccine.status.name}'),
                  Text('Number of doses: ${vaccine.numberOfDoses}'),
                  Text('Intervals: ${vaccine.intervals.join(', ')}'),
                  Text('Interval type: ${vaccine.intervalType.name}'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    // add to calendar
                  },
                  child: const Text('Add to calendar'),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
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
                vaccine.status == Status.obligatory
                    ? Icons.warning
                    : Icons.info,
                color: vaccine.status == Status.obligatory
                    ? Colors.red
                    : Colors.blue,
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
