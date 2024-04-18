import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/models/types/status.dart';

const kIconSize = 40.0;

Map vaccineStatusIconMap = {
  Status.done: const Icon(
    Icons.done,
    size: kIconSize,
    color: Colors.green,
  ),
  Status.pending: const Icon(
    Icons.pending_actions,
    size: kIconSize,
    color: Colors.orange,
  ),
  Status.canceled: const Icon(
    Icons.cancel,
    size: kIconSize,
    color: Colors.red,
  ),
};
