import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';
import 'package:vaccination_managment_app/views/vaccines/vaccine_item.dart';

class VaccinesScreen extends StatefulWidget {
  const VaccinesScreen({Key? key}) : super(key: key);

  @override
  State<VaccinesScreen> createState() => _VaccinesScreenState();
}

class _VaccinesScreenState extends State<VaccinesScreen> {
  List<Vaccine> vaccines = [
    Vaccine(
      id: '1',
      name: 'Hepatitis B',
      type: 'Viral',
      obligation: Obligation.obligatory,
      numberOfDoses: 3,
      intervals: [0, 1, 6],
      intervalType: IntervalType.months,
    ),
    Vaccine(
      id: '2',
      name: 'Rotavirus',
      type: 'Viral',
      obligation: Obligation.recommended,
      numberOfDoses: 2,
      intervals: [2, 4],
      intervalType: IntervalType.months,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return VaccineItem(
          vaccines[index],
        );
      },
    );
  }
}
