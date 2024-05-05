import 'package:vaccination_managment_app/models/types/vaccine_status.dart';

class VaccineRecord {
  final int id;
  final String name;
  final VaccineStatus status;
  final int dose;
  final List<DateTime> doseDates;

  VaccineRecord({
    required this.id,
    required this.name,
    required this.status,
    required this.dose,
    required this.doseDates,
  });

  factory VaccineRecord.fromJson(Map<String, dynamic> json) {
    return VaccineRecord(
      id: json['id'],
      name: json['vaccine'],
      status: json['status'] == 'done'
          ? VaccineStatus.done
          : json['status'] == 'pending'
              ? VaccineStatus.pending
              : VaccineStatus.canceled,
      dose: json['dose'],
      doseDates: (json['all_dates'] as List)
          .map((date) => DateTime.parse(date))
          .toList(),
    );
  }

  factory VaccineRecord.asNull() {
    return VaccineRecord(
      id: -1,
      name: '',
      status: VaccineStatus.canceled,
      dose: 0,
      doseDates: [],
    );
  }
}
