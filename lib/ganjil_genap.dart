import 'package:flutter/material.dart';

class OddEvenPage extends StatelessWidget {
  final TextEditingController numberController;

  OddEvenPage({required this.numberController});

  void showResultDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil'),
          content: Text(result),
          actions: [
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  void checkNumber(BuildContext context) {
    final number = int.tryParse(numberController.text);
    String result;

    if (number == null) {
      result = 'Masukkan angka yang valid!';
    } else {
      result = (number % 2 == 0) ? 'Bilangan Genap' : 'Bilangan Ganjil';
    }

    showResultDialog(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bilangan Ganjil/Genap')),
      body: Container(
        color: Colors.lightBlue[30],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => checkNumber(context), // Panggil fungsi di sini
              child: Text('Cek Ganjil/Genap'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}