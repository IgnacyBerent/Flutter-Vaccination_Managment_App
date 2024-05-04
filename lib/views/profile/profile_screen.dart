import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:vaccination_managment_app/api/auth.dart';
import 'package:vaccination_managment_app/views/my_calendar/my_calendar_screen.dart';
import 'package:vaccination_managment_app/widgets/icons/round_app_icon.dart';
import 'package:vaccination_managment_app/views/vaccination_history/vaccination_history_screen.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Authenticate _auth = Authenticate();

  final butotnsSpacing = const SizedBox(height: 25);

  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;

    NotificationSettings settings = await fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
      final pushNotificationToken = await fcm.getToken();
      if (pushNotificationToken != null) {
        await _auth.sendPushNotificationToken(pushNotificationToken);
      }
    } else {
      log('User declined or has not yet responded to the permission request');
    }
  }

  @override
  void initState() {
    super.initState();
    setupPushNotifications();
    FirebaseMessaging.instance.getToken().then((token) {
      log('Push Notification Token: $token');
    });
  }

  void _logout() async {
    await _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const RoundAppIcon(
            imagePath: 'assets/vaccinate_app_icon.png',
            borderColor: Color(0xFF00BF83),
          ),
          butotnsSpacing,
          MyIconButton(
            icon: Icons.timelapse,
            buttonText: "My History",
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
            icon: Icons.calendar_today,
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
            onPressed: _logout,
            icon: Icons.logout,
            placement: 'right',
            width: 260,
            height: 70,
          ),
        ],
      ),
    );
  }
}
