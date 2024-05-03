import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vaccination_managment_app/firebase_options.dart';
import 'package:vaccination_managment_app/widgets/widget_tree.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            foregroundColor: const Color(0xFF2F4858),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            disabledForegroundColor: const Color.fromARGB(255, 11, 163, 118),
            disabledBackgroundColor: const Color.fromARGB(255, 35, 59, 44),
            backgroundColor: const Color.fromARGB(255, 204, 231, 248),
            shadowColor: const Color.fromARGB(255, 31, 32, 32),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      home: const WidgetTree(),
    );
  }
}
