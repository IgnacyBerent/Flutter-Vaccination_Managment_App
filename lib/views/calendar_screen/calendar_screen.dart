import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
import 'package:vaccination_managment_app/models/types/vaccine_status.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';
import 'package:vaccination_managment_app/styles/text_styles.dart';
import 'package:vaccination_managment_app/views/calendar_screen/calendar_elements/get_calendar_builder.dart';
import 'package:vaccination_managment_app/views/calendar_screen/calendar_elements/my_calendar_style.dart';
import 'package:vaccination_managment_app/views/calendar_screen/calendar_elements/select_vaccine_popup.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  final _db = DatabaseApi();
  List<VaccineRecord> _vaccineRecords = [];

  @override
  void initState() {
    super.initState();
    _refreshVaccineReocrds();
  }

  Future<void> _refreshVaccineReocrds() async {
    Navigator.of(context).pop();
    _vaccineRecords = await _db.fetchVaccineRecords();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 460,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF2F4858),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TableCalendar(
            calendarBuilders: getCalendarBuilders(_vaccineRecords),
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: popupTitleTextStyle,
            ),
            calendarStyle: myCalendarStyle,
            daysOfWeekHeight: 40,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle:
                  descriptionTextStyle.copyWith(fontWeight: FontWeight.w900),
              weekendStyle:
                  descriptionTextStyle.copyWith(fontWeight: FontWeight.w900),
            ),
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.now().add(const Duration(days: 365 * 30)),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return _vaccineRecords.any((record) {
                return record.status != VaccineStatus.canceled &&
                    record.doseDates.any((doseDate) {
                      return isSameDay(doseDate, day);
                    });
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
              VaccineRecord selectedRecord = _vaccineRecords.firstWhere(
                (record) =>
                    record.status != VaccineStatus.canceled &&
                    record.doseDates.any((doseDate) {
                      return isSameDay(doseDate, selectedDay);
                    }),
                orElse: () => VaccineRecord.asNull(),
              );
              if (selectedRecord.id != -1) {
                selectVaccinePopup(context, selectedDay, selectedRecord);
              }
            },
          ),
        ),
      ),
    );
  }
}
