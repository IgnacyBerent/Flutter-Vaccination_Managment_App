import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/widgets/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 36, 255, 153),
        ),
        useMaterial3: true,
      ),
      home: const WidgetTree(),
    );
  }
}
