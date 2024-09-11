import 'package:flutter/material.dart';
import 'login.dart';
import 'penjumlahan_pengurangan.dart';
import 'ganjil_genap.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  bool isLoggedIn = false;
  String welcomeMessage = '';

  final List<Map<String, String>> dataKelompok = [
    {'NIM': '124220016', 'Nama': 'Berlian Ariqa Hanna'},
    {'NIM': '124220023', 'Nama': 'Kesha Azka Afleni'},
    {'NIM': '124220025', 'Nama': 'Aafiyah Najlaa Labiibah'},
  ];

  void login() {
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() {
        isLoggedIn = true;
        welcomeMessage = 'Selamat datang, ${usernameController.text}!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aplikasi Bilangan')),
      body: Container(
        color: Color(0xFF101820),
        padding: const EdgeInsets.all(16.0),
        child: isLoggedIn ? buildMenuContent() : buildLoginForm(),
      ),
    );
  }

  Widget buildLoginForm() {
    return LoginPage(
      usernameController: usernameController,
      passwordController: passwordController,
      login: login,
      dataKelompok: dataKelompok,
    );
  }

  Widget buildMenuContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(welcomeMessage, style: TextStyle(color: Colors.white, fontSize: 24)),
          SizedBox(height: 10),
          Text('Menu Utama', style: TextStyle(color: Colors.white, fontSize: 24)),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CalculatorPage(
                num1Controller: num1Controller,
                num2Controller: num2Controller,
              ),
            )),
            child: Text('Penjumlahan dan Pengurangan'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
              backgroundColor: Colors.blueGrey[300],
              foregroundColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OddEvenPage(
                numberController: numberController,
              ),
            )),
            child: Text('Bilangan Ganjil/Genap'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
              backgroundColor: Colors.blueGrey[300],
              foregroundColor: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isLoggedIn = false; // Log out
                welcomeMessage = ''; // Reset welcome message
                num1Controller.clear(); // Clear input fields
                num2Controller.clear();
                numberController.clear();
              });
            },
            child: Text('Log Out'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}