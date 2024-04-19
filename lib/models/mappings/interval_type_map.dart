import 'package:vaccination_managment_app/models/types/vaccine_interval_type.dart';

Map intervalTypeMap = {
  null: VaccineIntervalType.oneTime,
  "NL": VaccineIntervalType.oneTime,
  "DY": VaccineIntervalType.days,
  "WS": VaccineIntervalType.weeks,
  "MO": VaccineIntervalType.months,
  "YR": VaccineIntervalType.years,
};
