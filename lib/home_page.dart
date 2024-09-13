import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter
import 'login.dart'; // Mengimpor halaman login
import 'penjumlahan_pengurangan.dart'; // Mengimpor halaman penjumlahan dan pengurangan
import 'ganjil_genap.dart'; // Mengimpor halaman bilangan ganjil/genap
import 'data_kelompok.dart'; // Mengimpor halaman data kelompok

class HomePage extends StatefulWidget { // Mendefinisikan HomePage sebagai widget stateful
  @override
  _HomePageState createState() => _HomePageState(); // Membuat state untuk HomePage
}

class _HomePageState extends State<HomePage> {
  final TextEditingController usernameController = TextEditingController(); // Kontrol input untuk username
  final TextEditingController passwordController = TextEditingController(); // Kontrol input untuk password
  final TextEditingController num1Controller = TextEditingController(); // Kontrol input untuk angka pertama
  final TextEditingController num2Controller = TextEditingController(); // Kontrol input untuk angka kedua
  final TextEditingController numberController = TextEditingController(); // Kontrol input untuk bilangan ganjil/genap

  bool isLoggedIn = false; // Status login pengguna
  String welcomeMessage = ''; // Pesan selamat datang

  // Daftar data kelompok
  final List<Map<String, String>> dataKelompok = [
    {'NIM': '124220016', 'Nama': 'Berlian Ariqa Hanna'},
    {'NIM': '124220023', 'Nama': 'Kesha Azka Afleni'},
    {'NIM': '124220025', 'Nama': 'Aafiyah Najlaa Labiibah'},
  ];

  // Fungsi untuk menangani login
  void login() {
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() { // Memperbarui state
        isLoggedIn = true; // Mengatur status login menjadi true
        welcomeMessage = 'Selamat datang, ${usernameController.text}!'; // Mengatur pesan selamat datang
      });
    }
  }

  @override
  Widget build(BuildContext context) { // Metode untuk membangun tampilan widget
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator')), // Judul aplikasi di AppBar
      body: Container(
        color: Colors.grey[300], // Warna latar belakang
        padding: const EdgeInsets.all(16.0), // Padding di sekeliling konten
        child: isLoggedIn ? buildMenuContent() : buildLoginForm(), // Menampilkan konten berdasarkan status login
      ),
    );
  }

  // Widget untuk membangun form login
  Widget buildLoginForm() {
    return LoginPage(
      usernameController: usernameController, // Menghubungkan kontroler username
      passwordController: passwordController, // Menghubungkan kontroler password
      login: login, // Menghubungkan fungsi login
      dataKelompok: dataKelompok, // Menghubungkan data kelompok
    );
  }

  // Widget untuk membangun konten menu setelah login
  Widget buildMenuContent() {
    return SingleChildScrollView( // Membungkus konten dalam SingleChildScrollView untuk pengguliran
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Menyusun widget di atas
        children: [
          Text(welcomeMessage, style: TextStyle(color: Colors.blueGrey[900], fontSize: 24, fontWeight: FontWeight.bold)), // Menampilkan pesan selamat datang
          SizedBox(height: 10), // Ruang kosong di bawah pesan
          Text('Menu Utama', style: TextStyle(color: Colors.blueGrey[900], fontSize: 24, fontWeight: FontWeight.bold)), // Menampilkan judul menu
          SizedBox(height: 40), // Ruang kosong di bawah judul

          // Tombol untuk mengakses halaman Data Kelompok
          ElevatedButton(
            onPressed: () => Navigator.of(context).push( // Navigasi ke halaman Data Kelompok
                MaterialPageRoute(
                  builder: (context) => DataKelompokPage(dataKelompok: dataKelompok), // Menghubungkan data kelompok
                )
            ),
            child: Text('Data Kelompok'), // Teks tombol
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40), // Ukuran tombol
              backgroundColor: Colors.blueGrey[900], // Warna latar belakang tombol
              foregroundColor: Colors.white, // Warna teks tombol
            ),
          ),
          SizedBox(height: 20), // Ruang kosong di bawah tombol

          // Tombol untuk mengakses halaman Penjumlahan dan Pengurangan
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CalculatorPage(
                num1Controller: num1Controller, // Menghubungkan kontroler angka pertama
                num2Controller: num2Controller, // Menghubungkan kontroler angka kedua
              ),
            )),
            child: Text('Penjumlahan dan Pengurangan'), // Teks tombol
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40), // Ukuran tombol
              backgroundColor: Colors.blueGrey[900], // Warna latar belakang tombol
              foregroundColor: Colors.white, // Warna teks tombol
            ),
          ),
          SizedBox(height: 20), // Ruang kosong di bawah tombol

          // Tombol untuk mengakses halaman Bilangan Ganjil/Genap
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OddEvenPage(
                numberController: numberController, // Menghubungkan kontroler untuk bilangan
              ),
            )),
            child: Text('Bilangan Ganjil/Genap'), // Teks tombol
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40), // Ukuran tombol
              backgroundColor: Colors.blueGrey[900], // Warna latar belakang tombol
              foregroundColor: Colors.white, // Warna teks tombol
            ),
          ),
          SizedBox(height: 20), // Ruang kosong di bawah tombol

          // Tombol untuk melakukan logout
          ElevatedButton(
            onPressed: () {
              setState(() { // Memperbarui state
                isLoggedIn = false; // Mengatur status login menjadi false
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Anda berhasil Log Out')), // Pesan logout
                );
                // Menghapus teks di semua kontroler
                usernameController.clear();
                passwordController.clear();
                num1Controller.clear();
                num2Controller.clear();
                numberController.clear();
              });
            },
            child: Text('Log Out'), // Teks tombol
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40), // Ukuran tombol
              backgroundColor: Colors.blueGrey[300], // Warna latar belakang tombol
              foregroundColor: Colors.white, // Warna teks tombol
            ),
          ),
          SizedBox(height: 400), // Ruang kosong di bawah tombol
        ],
      ),
    );
  }
}