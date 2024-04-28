import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/vaccine_obligation.dart';
import 'package:vaccination_managment_app/views/vaccines/vaccine_obligation_icon.dart';

Map vaccineObligationIconMap = {
  VaccineObligation.mandatory: const VaccineObligationIcon(
    letter: 'M',
    statusColor: Color.fromARGB(255, 65, 0, 35),
  ),
  VaccineObligation.recommended: const VaccineObligationIcon(
    letter: 'R',
    statusColor: Color(0xFF008999),
  ),
  VaccineObligation.nonMandatory: const VaccineObligationIcon(
    letter: 'O',
    statusColor: Color(0xFF00AAA0),
  ),
};
