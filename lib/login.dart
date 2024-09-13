import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class LoginPage extends StatelessWidget { // Mendefinisikan kelas LoginPage sebagai widget stateless
  final TextEditingController usernameController; // Kontrol input untuk username
  final TextEditingController passwordController; // Kontrol input untuk password
  final Function login; // Fungsi yang dipanggil ketika login berhasil
  final List<Map<String, String>> dataKelompok; // Data kelompok (tidak digunakan di sini)

  // Konstruktor untuk menginisialisasi variabel instance
  LoginPage({
    required this.usernameController,
    required this.passwordController,
    required this.login,
    required this.dataKelompok,
  });

  @override
  Widget build(BuildContext context) { // Metode untuk membangun tampilan widget
    return SingleChildScrollView( // Membungkus konten dalam SingleChildScrollView untuk memungkinkan pengguliran
      padding: const EdgeInsets.all(16.0), // Menambahkan padding di sekeliling konten
      child: Column( // Menggunakan Column untuk menyusun widget secara vertikal
        children: [
          SizedBox(height: 20), // Menambahkan ruang kosong di atas
          Image.asset(
            'images/kalkulator.png', // Menampilkan gambar dari asset
            width: 100, // Lebar gambar
            height: 100, // Tinggi gambar
          ),
          SizedBox(height: 10), // Menambahkan ruang kosong setelah gambar
          SizedBox(height: 20), // Gap setelah tabel (ruang kosong)
          Card( // Menggunakan Card untuk memberikan efek elevasi
            elevation: 8, // Tingkat elevasi card
            shape: RoundedRectangleBorder( // Membentuk sudut card
              borderRadius: BorderRadius.circular(16), // Sudut membulat
            ),
            child: Padding( // Menambahkan padding di dalam card
              padding: const EdgeInsets.all(12.0),
              child: Column( // Menggunakan Column untuk menyusun widget di dalam card
                mainAxisSize: MainAxisSize.min, // Ukuran minimum untuk column
                children: [
                  Text(
                    'Login', // Judul login
                    style: TextStyle(
                      fontSize: 24, // Ukuran font
                      fontWeight: FontWeight.bold, // Menebalkan teks
                      color: Colors.black, // Warna teks
                    ),
                  ),
                  SizedBox(height: 20), // Menambahkan ruang kosong di bawah judul
                  TextField( // Widget untuk input username
                    controller: usernameController, // Menghubungkan kontroler
                    decoration: InputDecoration( // Dekorasi input
                      labelText: 'Username', // Teks label
                      border: OutlineInputBorder(), // Border input
                      prefixIcon: Icon(Icons.person, color: Colors.black), // Ikon di depan input
                      labelStyle: TextStyle(color: Colors.black), // Gaya label
                    ),
                  ),
                  SizedBox(height: 10), // Menambahkan ruang kosong di bawah username
                  TextField( // Widget untuk input password
                    controller: passwordController, // Menghubungkan kontroler
                    decoration: InputDecoration( // Dekorasi input
                      labelText: 'Password', // Teks label
                      border: OutlineInputBorder(), // Border input
                      prefixIcon: Icon(Icons.lock, color: Colors.black), // Ikon di depan input
                      labelStyle: TextStyle(color: Colors.black), // Gaya label
                    ),
                    obscureText: true, // Menyembunyikan teks yang dimasukkan
                  ),
                  SizedBox(height: 20), // Menambahkan ruang kosong di bawah password
                  ElevatedButton( // Tombol login
                    onPressed: () { // Fungsi ketika tombol ditekan
                      // Logika untuk memeriksa username dan password
                      if (usernameController.text == 'admin' && passwordController.text == '1234') {
                        // Jika username dan password cocok, panggil fungsi login
                        login();
                      } else {
                        // Tampilkan pesan kesalahan jika login gagal
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Username atau password salah')), // Pesan kesalahan
                        );
                      }
                    },
                    child: Text('Login'), // Teks pada tombol
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40), // Ukuran minimum tombol
                      backgroundColor: Colors.blueGrey[900], // Warna latar belakang tombol
                      foregroundColor: Colors.white, // Warna teks tombol
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 400), // Menambahkan ruang kosong di bawah card
        ],
      ),
    );
  }
}