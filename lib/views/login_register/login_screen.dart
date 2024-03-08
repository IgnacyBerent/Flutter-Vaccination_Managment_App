import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: 'Login',
      child: Text('Login'),
    );
  }
}
