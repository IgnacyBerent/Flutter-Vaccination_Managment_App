import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';
import 'package:vaccination_managment_app/views/home/vaccines/vaccine_item.dart';

class VaccinesScreen extends StatefulWidget {
  const VaccinesScreen({Key? key}) : super(key: key);

  @override
  State<VaccinesScreen> createState() => _VaccinesScreenState();
}

class _VaccinesScreenState extends State<VaccinesScreen> {
  List<Vaccine> vaccines = [
    Vaccine(
      name: 'Hepatitis B',
      type: 'Viral',
      status: Status.obligatory,
      numberOfDoses: 3,
      intervals: [0, 1, 6],
      intervalType: IntervalType.months,
    ),
    Vaccine(
      name: 'Rotavirus',
      type: 'Viral',
      status: Status.recommended,
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
