import 'package:flutter/material.dart';
import 'package:hello_flutter/material_app.dart';
import 'package:hello_flutter/stateful.dart';

void main() {
  runApp(const AppMatareal());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text('selamat datang di flutter'))),
      theme: ThemeData.dark(),
    );
  }
}
