import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';
import 'package:vaccination_managment_app/views/vaccines_screen/vaccines_screen_elements/vaccine_item.dart';
import 'package:vaccination_managment_app/api/database_api.dart';

class VaccinesScreen extends StatefulWidget {
  const VaccinesScreen({Key? key}) : super(key: key);

  @override
  State<VaccinesScreen> createState() => _VaccinesScreenState();
}

class _VaccinesScreenState extends State<VaccinesScreen> {
  final DatabaseApi _db = DatabaseApi();
  List<Vaccine> vaccines = [];

  @override
  void initState() {
    super.initState();
    _db.fetchVaccines().then((value) {
      setState(() {
        vaccines = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(vaccines.length, (index) {
        return VaccineItem(
          vaccines[index],
        );
      }),
    );
  }
}
