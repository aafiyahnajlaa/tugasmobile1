import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function login;
  final List<Map<String, String>> dataKelompok;

  LoginPage({
    required this.usernameController,
    required this.passwordController,
    required this.login,
    required this.dataKelompok,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            // Judul Daftar Anggota Kelompok
            Text(
              'Daftar Anggota Kelompok',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            // Tampilkan data kelompok dalam tabel
            Card(
              color: Colors.lightBlue[50],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Untuk scroll horizontal
                child: DataTable(
                  columns: [
                    DataColumn(label: Center(child: Text('NIM', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
                    DataColumn(label: Center(child: Text('Nama', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
                  ],
                  rows: dataKelompok.map((item) {
                    return DataRow(
                      cells: [
                        DataCell(Center(child: Text(item['NIM']!, style: TextStyle(color: Colors.black)))),
                        DataCell(Center(child: Text(item['Nama']!, style: TextStyle(color: Colors.black)))),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
           SizedBox(height: 20), // Gap setelah tabel
            // Tampilkan form login
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => login(),
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        backgroundColor: Colors.blueGrey[900], // bluegrey
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}