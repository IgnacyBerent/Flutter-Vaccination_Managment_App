enum Status {
  done,
  undergoing,
}

class VaccineRecord {
  final String id;
  final String name;
  final String type;
  final Status status;
  final List<DateTime?> doses;
  final DateTime? nextDose;

  VaccineRecord({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.doses,
    required this.nextDose,
  });
}
