import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class CalculatorPage extends StatelessWidget { // Mendefinisikan CalculatorPage sebagai widget stateless
  final TextEditingController num1Controller; // Kontrol input untuk angka pertama
  final TextEditingController num2Controller; // Kontrol input untuk angka kedua

  // Konstruktor untuk inisialisasi kontroler
  CalculatorPage({
    required this.num1Controller,
    required this.num2Controller,
  });

  // Fungsi untuk menampilkan dialog hasil
  void showResultDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil'), // Judul dialog
          content: Text('Hasil: $result'), // Konten dialog yang menampilkan hasil
          actions: [
            TextButton(
              child: Text('Tutup'), // Teks tombol untuk menutup dialog
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menghitung hasil penjumlahan atau pengurangan
  void calculate(BuildContext context, String operation) {
    final num1 = double.tryParse(num1Controller.text) ?? 0; // Mengonversi input menjadi angka
    final num2 = double.tryParse(num2Controller.text) ?? 0; // Mengonversi input menjadi angka
    String result; // Variabel untuk menyimpan hasil

    // Melakukan operasi berdasarkan jenis operasi
    if (operation == '+') {
      result = (num1 + num2).toStringAsFixed(0); // Hasil penjumlahan - tanpa ada angka dibelakang koma
    } else {
      result = (num1 - num2).toStringAsFixed(0); // Hasil pengurangan
    }

    showResultDialog(context, result); // Menampilkan dialog dengan hasil
  }

  @override
  Widget build(BuildContext context) { // Metode untuk membangun tampilan widget
    return Scaffold(
      appBar: AppBar(title: Text('Penjumlahan dan Pengurangan')), // Judul aplikasi di AppBar
      body: Container(
        color: Colors.grey[300], // Warna latar belakang
        padding: const EdgeInsets.all(16.0), // Padding di sekeliling konten
        child: Column( // Menggunakan Column untuk menyusun widget secara vertikal
          children: [
            TextField( // Widget untuk input angka pertama
              controller: num1Controller, // Menghubungkan kontroler
              decoration: InputDecoration(
                labelText: 'Angka 1', // Teks label
                border: OutlineInputBorder(), // Border input
              ),
              keyboardType: TextInputType.number, // Menentukan tipe keyboard untuk angka
            ),
            SizedBox(height: 16), // Ruang kosong di bawah input angka pertama
            TextField( // Widget untuk input angka kedua
              controller: num2Controller, // Menghubungkan kontroler
              decoration: InputDecoration(
                labelText: 'Angka 2', // Teks label
                border: OutlineInputBorder(), // Border input
              ),
              keyboardType: TextInputType.number, // Menentukan tipe keyboard untuk angka
            ),
            SizedBox(height: 20), // Ruang kosong di bawah input angka kedua
            Row( // Menggunakan Row untuk menyusun tombol operasi secara horizontal
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Menyusun tombol dengan ruang di antara
              children: [
                ElevatedButton( // Tombol untuk penjumlahan
                  onPressed: () => calculate(context, '+'), // Panggil fungsi calculate untuk penjumlahan
                  child: Text('+'), // Teks tombol
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900], // Warna latar belakang tombol
                    foregroundColor: Colors.white, // Warna teks tombol
                  ),
                ),
                ElevatedButton( // Tombol untuk pengurangan
                  onPressed: () => calculate(context, '-'), // Panggil fungsi calculate untuk pengurangan
                  child: Text('-'), // Teks tombol
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900], // Warna latar belakang tombol
                    foregroundColor: Colors.white, // Warna teks tombol
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Ruang kosong di bawah tombol operasi
            ElevatedButton( // Tombol untuk mereset input
              onPressed: () {
                num1Controller.clear(); // Menghapus input angka pertama
                num2Controller.clear(); // Menghapus input angka kedua
              },
              child: Text('Reset'), // Teks tombol
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[300], // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}