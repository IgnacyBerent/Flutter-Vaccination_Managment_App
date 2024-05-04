import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_elements/vaccination_history_item.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template.dart';
import 'package:vaccination_managment_app/widgets/popups/confirmation_popup.dart';

class VaccinationHistoryScreen extends StatefulWidget {
  const VaccinationHistoryScreen({Key? key}) : super(key: key);

  @override
  State<VaccinationHistoryScreen> createState() =>
      _VaccinationHistoryScreenState();
}

class _VaccinationHistoryScreenState extends State<VaccinationHistoryScreen> {
  final DatabaseApi _db = DatabaseApi();
  List<VaccineRecord> _vaccineRecords = [];

  @override
  void initState() {
    super.initState();
    _refreshVaccineReocrds();
  }

  Future<void> _refreshVaccineReocrds() async {
    _vaccineRecords = await _db.fetchVaccineRecords();
    setState(() {});
  }

  Future<void> _cancelVaccine(int vaccinationId) async {
    await _db.cancelVaccine(vaccinationId);
    _refreshVaccineReocrds();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: 'Vaccination History',
      child: ListView.builder(
        itemCount: _vaccineRecords.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_vaccineRecords[index].toString()),
            confirmDismiss: (direction) async {
              return await confirmationPopup(
                context,
                'Delete Vaccine',
                'Are you sure you want to delete this vaccine?',
              );
            },
            onDismissed: (direction) async {
              try {
                await _db.deleteVaccineRecord(_vaccineRecords[index].id);
                setState(() {
                  _vaccineRecords.removeAt(index);
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
              vaccine: _vaccineRecords[index],
              onCancel: () => _cancelVaccine(_vaccineRecords[index].id),
            ),
          );
        },
      ),
    );
  }
}
