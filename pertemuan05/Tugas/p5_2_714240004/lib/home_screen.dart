import 'package:flutter/material.dart';
import 'package:p5_2_714240004/detail_screen.dart';

// Halaman pertama: menampilkan Card profil singkat
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data yang akan di-pass ke DetailScreen
    const String nama = 'MUHAMMAD FARIS RODJA';
    const String npm = '714240004';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas Pertemuan 5',
          style: TextStyle(
            fontFamily: 'MetalMania',
            fontSize: 22,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          color: const Color(0xFF1A1A1A),
          elevation: 12,
          shadowColor: const Color.fromARGB(255, 201, 255, 5).withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color.fromARGB(220, 255, 230, 0), width: 1.5),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Foto Profil - ClipRRect untuk sudut rounded
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'images/Fotoutama.webp',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                // Nama Mahasiswa - Custom Font MetalMania
                const Text(
                  nama,
                  style: TextStyle(
                    fontFamily: 'MetalMania',
                    fontSize: 26,
                    color: Color.fromARGB(255, 216, 240, 0),
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // NPM
                const Text(
                  'NPM: $npm',
                  style: TextStyle(
                    fontFamily: 'MetalMania',
                    fontSize: 18,
                    color: Color(0xFFBDBDBD),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 28),

                // Tombol navigasi ke DetailScreen (Navigator.push)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(
                          nama: nama, // passing data via constructor
                          npm: npm,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 180, 253, 10),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 6,
                    shadowColor: const Color.fromARGB(255, 185, 245, 20).withValues(alpha: 0.4),
                  ),
                  child: const Text(
                    'Lihat Detail Profil',
                    style: TextStyle(
                      fontFamily: 'MetalMania',
                      fontSize: 18,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}