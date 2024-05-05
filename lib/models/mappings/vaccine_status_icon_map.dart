import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/widgets/icons/status_icon.dart';

const kIconSize = 60.0;
const kFontSize = 30.0;

Map vaccineStatusIconMap = {
  VaccineStatus.done: const StatusIcon(
    letter: "D",
    statusColor: Color.fromARGB(255, 0, 148, 101),
    size: kIconSize,
    fontSize: kFontSize,
  ),
  VaccineStatus.pending: const StatusIcon(
    letter: "P",
    statusColor: Color.fromARGB(255, 221, 133, 0),
    size: kIconSize,
    fontSize: kFontSize,
  ),
  VaccineStatus.canceled: const StatusIcon(
    letter: "C",
    statusColor: Color.fromARGB(255, 221, 0, 85),
    size: kIconSize,
    fontSize: kFontSize,
  ),
};
