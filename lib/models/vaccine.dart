import 'package:vaccination_managment_app/models/mappings/interval_type_map.dart';
import 'package:vaccination_managment_app/models/mappings/obligation_map.dart';
import 'package:vaccination_managment_app/models/types/vaccine_interval_type.dart';
import 'package:vaccination_managment_app/models/types/vaccine_obligation.dart';

class Vaccine {
  final int id;
  final String name;
  final String type;
  final VaccineObligation obligation;
  final int numberOfDoses;
  final List<int>? intervals;
  final VaccineIntervalType intervalType;

  Vaccine({
    required this.id,
    required this.name,
    required this.type,
    required this.obligation,
    required this.numberOfDoses,
    required this.intervals,
    required this.intervalType,
  });

  factory Vaccine.fromJson(Map<String, dynamic> json) {
    return Vaccine(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      obligation: obligationMap[json['obligation']] as VaccineObligation,
      numberOfDoses: json['quantity_of_doses'],
      intervals: json['interval'] == "NL"
          ? null
          : (json['interval'] as String).split(',').map((str) {
              try {
                return int.parse(str);
              } catch (e) {
                return 0; // Default value
              }
            }).toList(),
      intervalType: intervalTypeMap[json['period']] as VaccineIntervalType,
    );
  }
}
