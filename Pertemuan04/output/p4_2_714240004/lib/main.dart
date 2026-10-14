import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Pertemuan 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const TugasPertemuan4Page(),
    );
  }
}

class TugasPertemuan4Page extends StatelessWidget {
  const TugasPertemuan4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Tugas Pertemuan 4',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Box 1 (Biru): Ukuran pas dengan bayangan halus di bawah
              SizedBox(
                width: 300,
                height: 75,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Box 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Baris untuk Box 2 dan Box 3
              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    // Box 2 (Merah): Outline border tebal, teks di pojok kiri atas
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Box 2',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Box 3 (Hijau): Sudut asimetris (kiri atas & kanan bawah tumpul), teks di pojok kanan bawah
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35),
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          'Box 3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}