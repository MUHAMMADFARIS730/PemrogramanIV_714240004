import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Stateless'),
      ),
      body: const Center(
        child: Text('Ini adalah StatelessWidget'),
      ),
    );
  }
}