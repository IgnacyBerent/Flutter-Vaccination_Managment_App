import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/layout_template/layout_template.dart';

class MyCalendarScreen extends StatelessWidget {
  const MyCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LayoutTemplate(
      screenName: 'My Calendar',
      child: Text('My Calendar'),
    );
  }
}
