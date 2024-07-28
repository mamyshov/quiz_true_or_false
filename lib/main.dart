import 'package:flutter/material.dart';
import 'package:quiz_true_or_false/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz True or false',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 19, 214, 6)),
            //primaryColor: Colors.red,
            textTheme: TextTheme(
              titleMedium: TextStyle(color: Colors.white),
              titleLarge: TextStyle(color: Colors.white),
              // bodyMedium: TextStyle(color: const Color.fromARGB(255, 58, 55, 55)),
              // headlineMedium: TextStyle(color: Colors.white),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.greenAccent),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
            iconTheme: IconThemeData(color: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: const Quiz());
  }
}
