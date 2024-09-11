import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  final TextEditingController num1Controller;
  final TextEditingController num2Controller;

  CalculatorPage({
    required this.num1Controller,
    required this.num2Controller,
  });

  void showResultDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil'),
          content: Text('Hasil: $result'),
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

  void calculate(BuildContext context, String operation) {
    final num1 = double.tryParse(num1Controller.text) ?? 0;
    final num2 = double.tryParse(num2Controller.text) ?? 0;
    String result;

    if (operation == '+') {
      result = (num1 + num2).toString();
    } else {
      result = (num1 - num2).toString();
    }

    showResultDialog(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Penjumlahan dan Pengurangan')),
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(
                labelText: 'Angka 1',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(
                labelText: 'Angka 2',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => calculate(context, '+'),
                  child: Text('+'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900],
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calculate(context, '-'),
                  child: Text('-'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900],
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                num1Controller.clear();
                num2Controller.clear();
              },
              child: Text('Reset'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[300],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}