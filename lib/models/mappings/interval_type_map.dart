import 'package:vaccination_managment_app/models/types/interval_type.dart';

Map intervalTypeMap = {
  null: IntervalType.oneTime,
  "NL": IntervalType.oneTime,
  "DY": IntervalType.days,
  "WS": IntervalType.weeks,
  "MO": IntervalType.months,
  "YR": IntervalType.years,
};
