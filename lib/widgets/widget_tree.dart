import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/api/jwt_token.dart';
import 'package:vaccination_managment_app/views/login_register/login_screen.dart';
import 'package:vaccination_managment_app/widgets/layout_template/navigator_layout_template.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  late Future<bool> isTokenExpired;

  @override
  void initState() {
    super.initState();
    isTokenExpired = JwtToken().isTokenExpired();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isTokenExpired,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.data == false) {
            return const NavigatorLayoutTemplate();
          } else {
            return const LoginScreen();
          }
        }
      },
    );
  }
}
