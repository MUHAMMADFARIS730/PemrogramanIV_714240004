import 'package:flutter/material.dart';

class MyStef extends StatefulWidget {
  const new({super.key});

  @override
  State<MyStef> createState() => _MyStefState();
}

class _MyStefState extends State<MyStef> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Text('Tambah : $counter'),
          ),
        ),
      ),
    );
  }
}
