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
}

Vaccine vaccineFromJson(Map<String, dynamic> json) {
  return Vaccine(
    id: json['id'],
    name: json['name'],
    type: json['type'],
    obligation: json['obligation'] == 'obligatory'
        ? Obligation.obligatory
        : Obligation.recommended,
    numberOfDoses: json['numberOfDoses'],
    intervals: List<int>.from(json['intervals']),
    intervalType: json['intervalType'] == 'days'
        ? IntervalType.days
        : json['intervalType'] == 'weeks'
            ? IntervalType.weeks
            : json['intervalType'] == 'months'
                ? IntervalType.months
                : IntervalType.years,
  );
}
