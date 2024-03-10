import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template.dart';

class VaccinationHistoryScreen extends StatelessWidget {
  const VaccinationHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LayoutTemplate(
      screenName: 'Vaccination History',
      child: Text('Vaccination History'),
    );
  }
}
