import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
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
  final DatabaseApi _db = DatabaseApi();
  final List<VaccineRecord> vaccines = [];

  @override
  void initState() {
    super.initState();
    _db.fetchVaccineRecords().then((value) {
      setState(() {
        vaccines.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: 'Vaccination History',
      child: ListView.builder(
        itemCount: vaccines.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(vaccines[index].toString()),
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete Vaccine'),
                    content: const Text(
                        'Are you sure you want to delete this vaccine?'),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Delete'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) async {
              try {
                await _db.deleteVaccineRecord(vaccines[index].id);
                setState(() {
                  vaccines.removeAt(index);
                });
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to delete vaccine!'),
                  ),
                );
              }
            },
            child: VaccineHistoryItem(
              vaccines[index],
            ),
          );
        },
      ),
    );
  }
}
