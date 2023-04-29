import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Array 2D & FPB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  int gcdResult = 0;

  List<List<int>> createArray() {
    List<List<int>> myArray = [];

    // baris 1
    List<int> row1 = [];
    for (int i = 1; i <= 4; i++) {
      row1.add(i * 6);
    }
    myArray.add(row1);

    // baris 2
    List<int> row2 = [];
    int oddNumber = 3;
    for (int i = 1; i <= 5; i++) {
      row2.add(oddNumber);
      oddNumber += 2;
    }
    myArray.add(row2);

    // baris 3
    List<int> row3 = [];
    for (int i = 1; i <= 6; i++) {
      row3.add(pow(i + 3, 3).toInt());
    }
    myArray.add(row3);

    // baris 4
    List<int> row4 = [];
    int number = 3;
    for (int i = 1; i <= 7; i++) {
      row4.add(number);
      number += 7;
    }
    myArray.add(row4);

    return myArray;
  }

  int calculateGcd(int a, int b) {
    if (a == 0) {
      return b;
    } else {
      return calculateGcd(b % a, a);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<List<int>> myArray = createArray();
    int a = 0;
    int b = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas Intro Dart"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tugas Intro Dart",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Reynhard Powiwi - 1301204091",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Isi List:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            for (int i = 0; i < myArray.length; i++)
              Text(
                myArray[i].join(" "),
                style: TextStyle(fontSize: 18),
              ),
            SizedBox(height: 20),
            Text(
              "Hitung FPB:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Input nilai a',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      a = int.parse(value);
                    },
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 150,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Input nilai b',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      b = int.parse(value);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int gcd = calculateGcd(a, b);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Hasil FPB"),
                    content: Text("FPB dari $a dan $b adalah $gcd"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Tutup"),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Hitung FPB'),
            ),
          ],
        ),
      ),
    );
  }
}
