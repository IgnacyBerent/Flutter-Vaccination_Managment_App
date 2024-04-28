import 'package:flutter/material.dart';

class FormViewContainer extends StatelessWidget {
  const FormViewContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 120, 25, 70),
      margin: const EdgeInsets.all(20),
      child: child,
    );
  }
}
