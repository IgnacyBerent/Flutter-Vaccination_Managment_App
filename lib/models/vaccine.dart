enum Obligation {
  obligatory,
  recommended,
}

enum IntervalType {
  days,
  weeks,
  months,
  years,
}

class Vaccine {
  final String id;
  final String name;
  final String type;
  final Obligation obligation;
  final int numberOfDoses;
  final List<int> intervals;
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
      intervals: (json['interval'] as String)
          .split(', ')
          .map((str) => int.parse(str))
          .toList(),
      intervalType:
          json['period'] == 'MO' ? IntervalType.months : IntervalType.years,
    );
  }
}
