enum Status {
  done,
  undergoing,
}

class VaccineRecord {
  final String id;
  final String name;
  final String type;
  final Status status;
  final int numberOfDoses;
  final List<int> intervals;

  VaccineRecord({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.numberOfDoses,
    required this.intervals,
  });
}
