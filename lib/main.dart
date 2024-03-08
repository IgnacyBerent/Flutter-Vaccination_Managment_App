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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 103, 255, 166),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            disabledForegroundColor: const Color.fromARGB(255, 11, 163, 118),
            disabledBackgroundColor: const Color.fromARGB(255, 35, 59, 44),
            backgroundColor: const Color.fromARGB(255, 56, 58, 57),
            shadowColor: const Color.fromARGB(255, 105, 241, 178),
            elevation: 7,
            side: const BorderSide(
                color: Color.fromARGB(255, 42, 54, 38),
                width: 2, //change border width
                style: BorderStyle.solid),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      home: const WidgetTree(),
    );
  }
}
