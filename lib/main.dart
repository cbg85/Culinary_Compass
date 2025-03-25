import 'package:flutter/material.dart';
import 'widgets/main_screen.dart'; // Make sure this file exists and path is correct

void main() {
  runApp(const CulinaryCompassApp());
}

class CulinaryCompassApp extends StatelessWidget {
  const CulinaryCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culinary Compass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MainScreen(), // This points to your bottom nav screen
    );
  }
}
