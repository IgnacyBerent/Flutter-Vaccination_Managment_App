import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/mappings/vaccine_status_icon_map.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_elements/vaccine_history_details.dart';

class VaccineHistoryItem extends StatelessWidget {
  const VaccineHistoryItem({
    super.key,
    required this.vaccine,
    required this.onCancel,
  });

  final VaccineRecord vaccine;
  final Function onCancel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(40, 255, 255, 255),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      shadowColor: Colors.black54,
      elevation: 5,
      child: InkWell(
        onTap: () {
          vaccineHistoryDetails(
            context,
            vaccine,
            onCancel,
          );
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
              child: vaccineStatusIconMap[vaccine.status],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vaccine.name,
                  style: popupTitleTextStyle,
                ),
                Text(
                  vaccine.status == VaccineStatus.pending
                      ? 'Next dose in: \n ${vaccine.doseDates[vaccine.dose - 1].difference(DateTime.now()).inDays} days'
                      : 'Status: ${vaccine.status.name.toUpperCase()}',
                  style: descriptionTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
