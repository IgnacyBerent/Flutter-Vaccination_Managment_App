import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/vaccine_obligation.dart';

const kIconSize = 40.0;

Map vaccineObligationIconMap = {
  VaccineObligation.mandatory: const Icon(
    Icons.warning,
    size: kIconSize,
    color: Colors.red,
  ),
  VaccineObligation.recommended: const Icon(
    Icons.info,
    size: kIconSize,
    color: Colors.blue,
  ),
  VaccineObligation.nonMandatory: const Icon(
    Icons.check,
    size: kIconSize,
    color: Colors.green,
  ),
};
