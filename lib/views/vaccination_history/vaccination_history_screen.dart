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
  List<VaccineRecord> vaccines = [];

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: 'Vaccination History',
      child: ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) {
          return VaccineHistoryItem(
            vaccines[index],
          );
        },
      ),
    );
  }
}
