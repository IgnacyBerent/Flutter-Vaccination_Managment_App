import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/views/login_register/login_screen.dart';
import 'package:vaccination_managment_app/widgets/layout_template/navigator_layout_template.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const NavigatorLayoutTemplate();
        } else {
          return const NavigatorLayoutTemplate();
          //return const LoginScreen();
        }
      },
    );
  }
}
