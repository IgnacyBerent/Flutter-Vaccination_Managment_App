import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/mappings/vaccine_status_icon_map.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_elements/vaccine_history_details.dart';
import 'package:vaccination_managment_app/widgets/card_container/card_container.dart';

class VaccineHistoryItem extends StatelessWidget {
  const VaccineHistoryItem({
    super.key,
    required this.vaccine,
    required this.refresh,
  });

  final VaccineRecord vaccine;
  final Future<void> Function() refresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          vaccineHistoryDetails(
            context,
            vaccine,
            refresh,
          );
        },
        child: SizedBox(
          height: 155,
          child: CardContainer(
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
                    child: vaccineStatusIconMap[vaccine.status],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vaccine.name,
                          style: popupTitleTextStyle,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        Text(
                          vaccine.status == VaccineStatus.pending
                              ? 'Next dose in: \n ${vaccine.doseDates[vaccine.dose - 1].difference(DateTime.now()).inDays} days'
                              : 'Status: ${vaccine.status.name.toUpperCase()}',
                          style: descriptionTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
