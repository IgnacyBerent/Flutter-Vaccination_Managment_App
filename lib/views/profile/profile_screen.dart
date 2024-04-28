import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/api/auth.dart';
import 'package:vaccination_managment_app/api/database_api.dart';
import 'package:vaccination_managment_app/views/my_calendar/my_calendar_screen.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_screen.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Authenticate _auth = Authenticate();
  final _db = DatabaseApi();

  final butotnsSpacing = const SizedBox(height: 25);

  void setupPushNotifications() async {
    throw UnimplementedError();
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();

    final pushNotificationToken = await fcm.getToken();
    if (pushNotificationToken != null) {
      await _db.sendPushNotificationToken(pushNotificationToken);
    }
  }

  @override
  void initState() {
    super.initState();
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    void logout() async {
      await _auth.logout();
    }

    return Container(
      width: double.infinity,
      child: Column(
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
          butotnsSpacing,
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
          butotnsSpacing,
          MyIconButton(
            buttonText: "Log Out",
            onPressed: logout,
            icon: const Icon(Icons.logout),
            placement: 'right',
            width: 260,
            height: 70,
          ),
        ],
      ),
    );
  }
}
