import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/obligation.dart';

const kIconSize = 40.0;

Map vaccineObligationIconMap = {
  Obligation.obligatory: const Icon(
    Icons.warning,
    size: kIconSize,
    color: Colors.red,
  ),
  Obligation.recommended: const Icon(
    Icons.info,
    size: kIconSize,
    color: Colors.blue,
  ),
};
