import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_item.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template.dart';

class VaccinationHistoryScreen extends StatefulWidget {
  const VaccinationHistoryScreen({Key? key}) : super(key: key);

  @override
  State<VaccinationHistoryScreen> createState() =>
      _VaccinationHistoryScreenState();
}

class _VaccinationHistoryScreenState extends State<VaccinationHistoryScreen> {
  List<VaccineRecord> vaccines = [
    VaccineRecord(
      id: '1',
      name: 'Hepatitis B',
      type: 'Inactivated',
      status: Status.undergoing,
      doses: [
        DateTime(2021, 1, 1),
        DateTime(2021, 1, 15),
        DateTime(2025, 2, 1),
      ],
      nextDose: DateTime(2025, 2, 1),
    ),
    VaccineRecord(
      id: '2',
      name: 'Hepatitis A',
      type: 'Inactivated',
      status: Status.done,
      doses: [
        DateTime(2021, 1, 1),
        DateTime(2021, 1, 15),
        DateTime(2021, 2, 1),
      ],
      nextDose: null,
    ),
    VaccineRecord(
      id: '3',
      name: 'Influenza',
      type: 'Inactivated',
      status: Status.undergoing,
      doses: [
        DateTime(2021, 1, 1),
        DateTime(2021, 1, 15),
        DateTime(2024, 4, 10),
      ],
      nextDose: DateTime(2024, 4, 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: 'Vaccination History',
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return VaccineHistoryItem(
            vaccines[index],
          );
        },
      ),
    );
  }
}
