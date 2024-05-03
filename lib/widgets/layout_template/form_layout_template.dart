import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template.dart';

class FormLayoutTemplate extends StatelessWidget {
  const FormLayoutTemplate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: '',
      child: Center(
        child: Container(
          height: 700,
          padding: const EdgeInsets.fromLTRB(25, 40, 25, 30),
          margin: const EdgeInsets.fromLTRB(20, 80, 20, 50),
          decoration: BoxDecoration(
            color: const Color.fromARGB(40, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
