import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/vaccine_obligation.dart';

const kIconSize = 40.0;

Map vaccineObligationIconMap = {
  VaccineObligation.mandatory: const Icon(
    Icons.warning,
    size: kIconSize,
    color: Color.fromARGB(255, 255, 0, 255),
  ),
  VaccineObligation.recommended: const Icon(
    Icons.info,
    size: kIconSize,
    color: Color(0xFF00677F),
  ),
  VaccineObligation.nonMandatory: const Icon(
    Icons.check_circle_outline,
    size: kIconSize,
    color: Color.fromARGB(255, 204, 231, 248),
  ),
};
