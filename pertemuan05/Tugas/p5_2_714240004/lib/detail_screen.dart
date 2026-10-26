import 'package:flutter/material.dart';

// Halaman kedua: detail profil, deskripsi, quote, dan gallery
class DetailScreen extends StatelessWidget {
  // Data dari HomeScreen diterima via constructor
  final String nama;
  final String npm;

  const DetailScreen({
    super.key,
    required this.nama,
    required this.npm,
  });

  @override
  Widget build(BuildContext context) {
    // Daftar gambar untuk gallery horizontal
    final List<String> galleryImages = [
      'images/gambarr1.jpeg',
      'images/gambarr2.jpeg',
      'images/gambarr3.jpeg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas pertemuan 5',
          style: TextStyle(
            fontFamily: 'MetalMania',
            fontSize: 22,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama & NPM yang di-pass dari HomeScreen
            Center(
              child: Column(
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontFamily: 'MetalMania',
                      fontSize: 28,
                      color: Color.fromARGB(255, 166, 233, 9),
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'NPM: $npm',
                    style: const TextStyle(
                      fontFamily: 'MetalMania',
                      fontSize: 18,
                      color: Color(0xFFBDBDBD),
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Divider gradient merah
            Container(
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(0, 44, 3, 110),
                    Color.fromARGB(255, 179, 243, 4),
                    Color.fromARGB(0, 16, 2, 80),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Deskripsi singkat tentang diri
            const Text(
              'Tentang Saya',
              style: TextStyle(
                fontFamily: 'MetalMania',
                fontSize: 22,
                color: Color.fromARGB(255, 245, 230, 28),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Banggalah pada dirimu sendiri, karena tidak ada seorang pun yang tau, '
              'bagaimana rasanya menjadi dirimu setiap hari.',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFE0E0E0),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),

            // Quote dari Hansen
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 24, 2, 105),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color.fromARGB(255, 191, 241, 8), width: 1),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '"Jangan tumbang sebelum semuanya tercapai. Ingat, Semua ini untuk orang tua demi orang tua."\n— jalan mennuju sukses',
                      style: TextStyle(
                        fontFamily: 'MetalMania',
                        fontSize: 16,
                        color: Color.fromARGB(255, 179, 241, 8),
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Gallery Aktivitas - ListView horizontal scroll
            const Text(
              'Gallery Aktivitas',
              style: TextStyle(
                fontFamily: 'MetalMania',
                fontSize: 22,
                color: Color.fromARGB(255, 186, 250, 9),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),

            // SizedBox membatasi tinggi ListView horizontal
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: galleryImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color.fromARGB(255, 202, 245, 10),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 209, 253, 11).withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    // ClipRRect untuk sudut rounded pada gambar
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        galleryImages[index],
                        width: 260,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),

            // Tombol Kembali - OutlinedButton + Navigator.pop
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 191, 255, 15),
                  side: const BorderSide(color: Color.fromARGB(255, 220, 255, 22), width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    fontFamily: 'MetalMania',
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}