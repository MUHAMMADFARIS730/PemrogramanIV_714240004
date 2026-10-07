import 'package:flutter/material.dart';
import 'package:hello_flutter/material_page.dart';

class AppMatareal extends StatelessWidget {
  const AppMatareal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(
        useMaterial3: false,
      ),
      home:HomePage()
    );
  }
}