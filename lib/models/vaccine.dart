enum Status {
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
  final String name;
  final String type;
  final Status status;
  final int numberOfDoses;
  final List<int> intervals;
  final IntervalType intervalType;

  Vaccine({
    required this.name,
    required this.type,
    required this.status,
    required this.numberOfDoses,
    required this.intervals,
    required this.intervalType,
  });
}

Vaccine vaccineFromJson(Map<String, dynamic> json) {
  return Vaccine(
    name: json['name'],
    type: json['type'],
    status:
        json['status'] == 'obligatory' ? Status.obligatory : Status.recommended,
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

Map<String, dynamic> vaccineToJson(Vaccine vaccine) {
  return {
    'name': vaccine.name,
    'type': vaccine.type,
    'status':
        vaccine.status == Status.obligatory ? 'obligatory' : 'recommended',
    'numberOfDoses': vaccine.numberOfDoses,
    'intervals': vaccine.intervals,
    'intervalType': vaccine.intervalType == IntervalType.days
        ? 'days'
        : vaccine.intervalType == IntervalType.weeks
            ? 'weeks'
            : vaccine.intervalType == IntervalType.months
                ? 'months'
                : 'years',
  };
}
