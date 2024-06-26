import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/vaccine_obligation.dart';
import 'package:vaccination_managment_app/widgets/icons/status_icon.dart';

const kIconSize = 60.0;
const kFontSize = 30.0;

Map vaccineObligationIconMap = {
  VaccineObligation.mandatory: const StatusIcon(
    letter: "!",
    statusColor: Color.fromARGB(255, 221, 0, 85),
    size: kIconSize,
    fontSize: kFontSize,
  ),
  VaccineObligation.recommended: const StatusIcon(
    letter: "R",
    statusColor: Color(0xFF00677F),
    size: kIconSize,
    fontSize: kFontSize,
  ),
  VaccineObligation.nonMandatory: const StatusIcon(
    letter: "O",
    statusColor: Color.fromARGB(255, 0, 148, 101),
    size: kIconSize,
    fontSize: kFontSize,
  ),
};
