import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/widgets/icons/status_icon.dart';

const kIconSize = 50.0;
const kFontSize = 25.0;

Map vaccineStatusIconMap = {
  VaccineStatus.done: const StatusIcon(
    letter: "D",
    statusColor: Color(0xFF00bf83),
    size: kIconSize,
    fontSize: kFontSize,
  ),
  VaccineStatus.pending: const StatusIcon(
    letter: "P",
    statusColor: Colors.orange,
    size: kIconSize,
    fontSize: kFontSize,
  ),
  VaccineStatus.canceled: const StatusIcon(
    letter: "C",
    statusColor: Colors.red,
    size: kIconSize,
    fontSize: kFontSize,
  ),
};
