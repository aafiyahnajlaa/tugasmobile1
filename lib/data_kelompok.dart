import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class DataKelompokPage extends StatelessWidget { // Mendefinisikan DataKelompokPage sebagai widget stateless
  final List<Map<String, String>> dataKelompok; // Daftar data kelompok

  // Konstruktor untuk inisialisasi dataKelompok
  DataKelompokPage({
    required this.dataKelompok,
  });

  @override
  Widget build(BuildContext context) { // Metode untuk membangun tampilan widget
    return Scaffold(
      appBar: AppBar(title: Text('Data Kelompok')), // Judul aplikasi di AppBar
      backgroundColor: Colors.grey[300], // Warna latar belakang
      body: Center( // Membungkus dengan Center untuk meratakan konten
        child: SingleChildScrollView( // Membungkus konten dalam SingleChildScrollView untuk pengguliran
          padding: const EdgeInsets.all(16.0), // Padding di sekeliling konten
          child: Column( // Menggunakan Column untuk menyusun widget secara vertikal
            mainAxisAlignment: MainAxisAlignment.start, // Menyusun widget di atas
            children: [
              SizedBox(height: 20), // Ruang kosong di atas
              Text(
                'Daftar Anggota', // Judul daftar anggota
                style: TextStyle(
                  fontSize: 20, // Ukuran font
                  fontWeight: FontWeight.bold, // Menebalkan teks
                  color: Colors.blueGrey[900], // Warna teks
                ),
              ),
              SizedBox(height: 10), // Ruang kosong di bawah judul
              Card( // Menggunakan Card untuk memberikan efek elevasi
                color: Colors.lightBlue[50], // Warna latar belakang card
                elevation: 8, // Tingkat elevasi card
                shape: RoundedRectangleBorder( // Membentuk sudut card
                  borderRadius: BorderRadius.circular(24), // Sudut membulat
                ),
                child: SingleChildScrollView( // Membungkus tabel dalam SingleChildScrollView untuk pengguliran horizontal
                  scrollDirection: Axis.horizontal,
                  child: DataTable( // Menggunakan DataTable untuk menampilkan data dalam format tabel
                    columns: [
                      DataColumn( // Kolom untuk NIM
                        label: Center(
                          child: Text(
                            'NIM', // Teks kolom
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Gaya teks
                          ),
                        ),
                      ),
                      DataColumn( // Kolom untuk Nama
                        label: Center(
                          child: Text(
                            'Nama', // Teks kolom
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Gaya teks
                          ),
                        ),
                      ),
                    ],
                    // Menentukan baris tabel berdasarkan dataKelompok
                    rows: dataKelompok.isNotEmpty
                        ? dataKelompok.map((item) { // Jika data tidak kosong
                      return DataRow( // Membuat DataRow untuk setiap item
                        cells: [
                          DataCell( // Sel untuk NIM
                            Align(
                              alignment: Alignment.centerLeft, // Mengatur alignment teks
                              child: Text(item['NIM']!, style: TextStyle(color: Colors.black)), // Menampilkan NIM
                            ),
                          ),
                          DataCell( // Sel untuk Nama
                            Align(
                              alignment: Alignment.centerLeft, // Mengatur alignment teks
                              child: Text(item['Nama']!, style: TextStyle(color: Colors.black)), // Menampilkan Nama
                            ),
                          ),
                        ],
                      );
                    }).toList() // Mengonversi hasil map menjadi list
                        : [ // Jika data kosong
                      DataRow( // Menampilkan pesan bahwa tidak ada data
                        cells: [
                          DataCell(Text('Tidak ada data')), // Sel untuk pesan
                          DataCell(Text('')), // Sel kosong
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Gap setelah tabel
            ],
          ),
        ),
      ),
    );
  }
}