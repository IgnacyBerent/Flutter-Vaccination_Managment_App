import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';

const kIconSize = 40.0;

Map vaccineStatusIconMap = {
  VaccineStatus.done: const Icon(
    Icons.done,
    size: kIconSize,
    color: Colors.green,
  ),
  VaccineStatus.pending: const Icon(
    Icons.pending_actions,
    size: kIconSize,
    color: Colors.orange,
  ),
  VaccineStatus.canceled: const Icon(
    Icons.cancel,
    size: kIconSize,
    color: Colors.red,
  ),
};
