import 'package:vaccination_managment_app/models/mappings/interval_type_map.dart';
import 'package:vaccination_managment_app/models/types/interval_type.dart';
import 'package:vaccination_managment_app/models/types/obligation.dart';

class Vaccine {
  final String id;
  final String name;
  final String type;
  final Obligation obligation;
  final int numberOfDoses;
  final List<int>? intervals;
  final IntervalType intervalType;

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
      id: json['id'].toString(),
      name: json['name'],
      type: json['type'],
      obligation: json['status'] == 'mandatory'
          ? Obligation.obligatory
          : Obligation.recommended,
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
      intervalType: intervalTypeMap[json['period']] as IntervalType,
    );
  }
}
