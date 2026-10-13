import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempat Wisata Bandung',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 1. BAGIAN JUDUL (TITLE)
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                'Ranca Upas',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),

            // 2. BAGIAN INFORMASI (ROW & COLUMN UNTUK IKON & TEKS)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Kolom 1: Kalender (Open Everyday)
                  Column(
                    children: const [
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text('Open Everyday'),
                    ],
                  ),
                  // Kolom 2: Jam Operasional (Access Time) - Tantangan Praktikum
                  Column(
                    children: const [
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0),
                      Text('09:00 - 20:00'),
                    ],
                  ),
                  // Kolom 3: Harga Tiket (Monetization On) - Tantangan Praktikum
                  Column(
                    children: const [
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text('Rp 20.000'),
                    ],
                  ),
                ],
              ),
            ),

            // 3. BAGIAN DESKRIPSI TEMPAT WISATA
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Ranca Upas Ciwidey adalah kawasan bumi perkemahan di bawah pengelolaan perhutani. '
                'Tempat ini berada di kawasan wisata Bandung Selatan, satu lokasi dengan kawah putih, '
                'kolam Cimanggu dan situ Patenggang. Banyak hal yang bisa dilakukan di kawasan wisata ini, '
                'seperti berkemah, berinteraksi dengan rusa, sampai bermain di water park dan mandi air panas.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
