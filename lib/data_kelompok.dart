import 'package:flutter/material.dart';

class DataKelompokPage extends StatelessWidget {
  final List<Map<String, String>> dataKelompok;

  DataKelompokPage({
    required this.dataKelompok,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Kelompok')),
      backgroundColor: Colors.grey[300],
      body: Center(  // Membungkus dengan Center untuk meratakan konten
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Daftar Anggota',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.lightBlue[50],
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                         label: Center(
                          child: Text(
                            'NIM', 
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: Text(
                            'Nama', 
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                    rows: dataKelompok.isNotEmpty
                        ? dataKelompok.map((item) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(item['NIM']!, style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                                DataCell(
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(item['Nama']!, style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                              ],
                            );
                          }).toList()
                        : [
                            DataRow(
                              cells: [
                                DataCell(Text('Tidak ada data')),
                                DataCell(Text('')),
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