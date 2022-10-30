import 'package:bmicalculator/screens/flash_screen.dart';
import 'package:bmicalculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/k': (context) => const FlashScreen(),
        '/': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "English",
      ),
    );
  }
}