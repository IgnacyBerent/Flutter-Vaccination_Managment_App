import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/api/auth.dart';
import 'package:vaccination_managment_app/views/my_calendar/my_calendar_screen.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_screen.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Authenticate auth = Authenticate();

    void logout() async {
      await auth.logout();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyIconButton(
          icon: const Icon(Icons.timelapse),
          buttonText: "Vaccination history",
          placement: 'right',
          width: 260,
          height: 70,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const VaccinationHistoryScreen();
                },
              ),
            );
          },
        ),
        const SizedBox(height: 15),
        MyIconButton(
          icon: const Icon(Icons.calendar_today),
          buttonText: "My Calendar",
          placement: 'right',
          width: 260,
          height: 70,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const MyCalendarScreen();
                },
              ),
            );
          },
        ),
        const SizedBox(height: 15),
        MyIconButton(
          buttonText: "Log Out",
          onPressed: logout,
          icon: const Icon(Icons.logout),
          placement: 'right',
          width: 260,
          height: 70,
        ),
      ],
    );
  }
}
