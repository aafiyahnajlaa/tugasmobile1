import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class OddEvenPage extends StatelessWidget { // Mendefinisikan OddEvenPage sebagai widget stateless
  final TextEditingController numberController; // Kontrol input untuk angka

  OddEvenPage({required this.numberController}); // Konstruktor untuk inisialisasi kontroler

  // Fungsi untuk menampilkan dialog hasil
  void showResultDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil'), // Judul dialog
          content: Text(result), // Konten dialog yang menampilkan hasil
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

  // Fungsi untuk memeriksa apakah angka genap atau ganjil
  void checkNumber(BuildContext context) {
    final number = int.tryParse(numberController.text); // Mencoba mengonversi input menjadi integer
    String result; // Variabel untuk menyimpan hasil

    if (number == null) { // Jika input tidak valid
      result = 'Masukkan angka yang valid!'; // Pesan kesalahan
    } else {
      // Menentukan apakah bilangan genap atau ganjil
      result = (number % 2 == 0) ? 'Bilangan Genap' : 'Bilangan Ganjil';
    }

    showResultDialog(context, result); // Menampilkan dialog dengan hasil
  }

  @override
  Widget build(BuildContext context) { // Metode untuk membangun tampilan widget
    return Scaffold(
      appBar: AppBar(title: Text('Bilangan Ganjil/Genap')), // Judul aplikasi di AppBar
      body: Container(
        color: Colors.lightBlue[30], // Warna latar belakang
        padding: const EdgeInsets.all(16.0), // Padding di sekeliling konten
        child: Column(
          children: [
            TextField( // Widget untuk input angka
              controller: numberController, // Menghubungkan kontroler
              decoration: InputDecoration(
                labelText: 'Masukkan Angka', // Teks label
                border: OutlineInputBorder(), // Border input
              ),
              keyboardType: TextInputType.number, // Menentukan tipe keyboard untuk angka
            ),
            SizedBox(height: 20), // Ruang kosong di bawah input
            ElevatedButton( // Tombol untuk memeriksa angka
              onPressed: () => checkNumber(context), // Panggil fungsi checkNumber saat tombol ditekan
              child: Text('Cek Ganjil/Genap'), // Teks tombol
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900], // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}