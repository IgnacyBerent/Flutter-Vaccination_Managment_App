import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.selectPage, {Key? key}) : super(key: key);

  final Function selectPage;

  @override
  Widget build(BuildContext context) {
    return Text('home');
  }
}
