import 'package:bmicalculator/components/app_colors.dart';
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
        '/': (context) => const FlashScreen(),
        '/home': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "English",
          scaffoldBackgroundColor: AppColors.secondary,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.secondary,
            elevation: 10,
          )),
    );
  }
}
