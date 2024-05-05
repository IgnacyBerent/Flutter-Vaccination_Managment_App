import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';

final myCalendarStyle = CalendarStyle(
  todayDecoration: const BoxDecoration(
    color: Color(0xFF2F4858),
    shape: BoxShape.circle,
  ),
  defaultTextStyle: descriptionTextStyle,
  weekendTextStyle: descriptionTextStyle,
);
