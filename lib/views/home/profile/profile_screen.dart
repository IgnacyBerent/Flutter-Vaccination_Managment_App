import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_icon_button.dart';
import 'package:vaccination_managment_app/widgets/buttons/my_text_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyIconButton(
          icon: const Icon(Icons.vaccines),
          buttonText: "My Vaccines",
          placement: 'right',
          width: 220,
          height: 70,
          onPressed: () {},
        ),
        const SizedBox(height: 15),
        MyIconButton(
          icon: const Icon(Icons.calendar_today),
          buttonText: "My Calendar",
          placement: 'right',
          width: 220,
          height: 70,
          onPressed: () {},
        ),
        const SizedBox(height: 15),
        MyIconButton(
          buttonText: "Log Out",
          onPressed: () {},
          icon: const Icon(Icons.logout),
          placement: 'right',
          width: 220,
          height: 70,
        ),
      ],
    );
  }
}
