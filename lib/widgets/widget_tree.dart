import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccination_managment_app/api/auth.dart';
import 'package:vaccination_managment_app/views/login_register/login_screen.dart';
import 'package:vaccination_managment_app/widgets/layout_template/navigator_layout_template.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  late Future<void> _getUserData;

  @override
  void initState() {
    super.initState();
    _getUserData =
        Provider.of<Authenticate>(context, listen: false).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // show a loading spinner while waiting
        } else {
          if (Provider.of<Authenticate>(context).currentUser != null) {
            return const NavigatorLayoutTemplate();
          } else {
            return const LoginScreen();
          }
        }
      },
    );
  }
}
