import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/models/vaccine.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
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

  Future<List<Vaccine>> _loadVaccines() async {
    List<Vaccine> fetchedVaccines = await _db.fetchVaccines();
    List<VaccineRecord> takenVaccines = await _db.fetchVaccineRecords();
    Set<String> takenVaccineNames = takenVaccines
        .where((vaccine) => vaccine.status != VaccineStatus.canceled)
        .map((vaccine) => vaccine.name)
        .toSet();
    List<Vaccine> filteredVaccines = fetchedVaccines
        .where((vaccine) => !takenVaccineNames.contains(vaccine.name))
        .toList();
    return filteredVaccines;
  }

  @override
  void initState() {
    super.initState();
    _loadVaccines().then((value) {
      setState(() {
        vaccines = value;
      });
    });
  }

  void _popVaccine(Vaccine vaccine) {
    setState(() {
      vaccines.remove(vaccine);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(vaccines.length, (index) {
        return VaccineItem(
          vaccine: vaccines[index],
          onVaccineAdd: () => _popVaccine(vaccines[index]),
        );
      }),
    );
  }
}
