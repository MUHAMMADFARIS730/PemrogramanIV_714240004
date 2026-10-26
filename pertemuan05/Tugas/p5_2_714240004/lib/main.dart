import 'package:flutter/material.dart';
import 'package:p5_2_714240004/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Profile Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 2, 49, 37),
        colorScheme: ColorScheme.dark(
          primary: const Color.fromARGB(255, 42, 250, 1),
          secondary: const Color.fromARGB(255, 42, 250, 1),
          surface: const Color.fromARGB(255, 2, 59, 50),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 2, 46, 26),
          foregroundColor: Color.fromARGB(255, 14, 243, 25),
          elevation: 4,
        ),
        fontFamily: 'MetalMania',
      ),
      home: const HomeScreen(),
    );
  }
}