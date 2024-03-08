import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: 'Register',
      child: Text('Register'),
    );
  }
}
