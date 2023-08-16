import 'package:flutter/material.dart';
import 'package:quick_recipe/screen/HomeScreen.dart';
import 'package:quick_recipe/screen/SignUpScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4a5568)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}