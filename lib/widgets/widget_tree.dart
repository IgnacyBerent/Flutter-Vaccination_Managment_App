import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/api/auth.dart';
import 'package:vaccination_managment_app/api/jwt_token.dart';
import 'package:vaccination_managment_app/views/login_register/login_screen.dart';
import 'package:vaccination_managment_app/widgets/layout_template/navigator_layout_template.dart';
import 'dart:async';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  StreamController<bool> tokenController = StreamController<bool>();
  Timer? timer;
  Authenticate auth = Authenticate();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      bool isTokenExpired = await JwtToken().isTokenExpired();
      if (isTokenExpired) {
        bool isTokenRefreshed = await auth.refreshToken();
        if (mounted) {
          setState(() {
            tokenController.add(!isTokenRefreshed);
          });
        }
      } else {
        if (mounted) {
          setState(() {
            tokenController.add(false);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    tokenController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: tokenController.stream,
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
