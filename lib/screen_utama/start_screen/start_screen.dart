import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget ini bertanggung jawab untuk menampilkan halaman awal kuis.
// Dibuat sebagai StatelessWidget karena tampilannya tidak akan berubah secara internal.
class StartScreen extends StatelessWidget {
  // Konstruktor standar untuk widget. `super.key` penting untuk identifikasi widget oleh Flutter.
  // active screen fungsinya untuk menampilkan widget screen yang dipanggil
  const StartScreen(this.activescreen, {super.key});

  final void Function() activescreen;

  @override
  // Metode `build` adalah tempat di mana UI untuk widget ini didefinisikan.
  Widget build(BuildContext context) {
    // `Column` digunakan untuk menyusun widget-widget di dalamnya secara vertikal (dari atas ke bawah).
    return Column(
      // `mainAxisSize: MainAxisSize.min` membuat Column hanya setinggi konten di dalamnya,
      // tidak meregang memenuhi layar secara vertikal.
      mainAxisSize: MainAxisSize.min,
      children: [
        // 1. Menampilkan gambar utama dari folder aset lokal.
        Image.asset('assets/images/sejarah.png'),

        // `SizedBox` digunakan untuk memberi jarak vertikal tetap sebesar 14 piksel.
        const SizedBox(
          height: 14,
        ),

        // 2. Menampilkan teks judul kuis.
        Text(
          "Indonesia History Quiz",
          // Memberi gaya pada teks menggunakan paket `google_fonts`.
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(255, 253, 208, 1), // Warna teks krem.
            fontSize: 25, // Ukuran font.
            fontWeight: FontWeight.bold, // Membuat teks menjadi tebal.
          ),
        ),

        // Memberi jarak vertikal lagi sebelum tombol.
        const SizedBox(
          height: 14,
        ),

        // 3. Membuat tombol yang memiliki ikon dan teks.
        ElevatedButton.icon(
          // `onPressed` adalah fungsi yang akan dijalankan saat tombol ditekan.
          // Di sinilah logika untuk memulai kuis akan ditempatkan.
          // panggil activescreen, artinya logika di file ini yang di pnaggil di screen utama
          onPressed: activescreen,
          // `style` digunakan untuk mengkustomisasi tampilan tombol.
          style: ElevatedButton.styleFrom(
            // **PENTING:** Untuk warna latar tombol, gunakan `backgroundColor`.
            // `foregroundColor` sebenarnya untuk warna ikon dan teks di dalamnya.
            // Kode di bawah sudah diperbaiki agar sesuai.
            backgroundColor: const Color.fromRGBO(184, 134, 11, 1), // Warna latar Kuning Oker.
            // `padding` memberikan ruang di dalam tombol, antara konten dan tepi.
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          // `icon` mendefinisikan widget ikon yang akan ditampilkan.
          icon: const Icon(
            Icons.arrow_right_alt, // Menggunakan ikon panah ke kanan.
            color: Color.fromRGBO(62, 39, 35, 1), // Warna ikon cokelat tua.
            size: 18, // Ukuran ikon.
          ),
          // `label` mendefinisikan widget teks yang akan ditampilkan di samping ikon.
          label: const Text(
            "Let's Quiz",
            style: TextStyle(
              color: Color.fromRGBO(62, 39, 35, 1), // Warna teks cokelat tua.
              fontSize: 18, // Ukuran font teks tombol.
            ),
          ),
        )
      ],
    );
  }
}