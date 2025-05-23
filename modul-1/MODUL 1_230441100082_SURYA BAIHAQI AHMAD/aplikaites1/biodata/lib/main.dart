import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey.withBlue(200),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: const Icon(Icons.people_outline),
          title: const Center(
            child: Text("BIODATA", style: TextStyle(color: Colors.white)),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("img/fto_wisuda_SMA.jpg", width: 200.0, height: 200.0),
            const SizedBox(height: 10), // Jarak antara elemen teks
            const Text(
              "Nama : Surya Baihaqi Ahmad",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Jenis Kelamin : Laki-laki",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Alamat : Dsn. Tengger, Ds. Blongko, Kec. Ngetos, Kab. Nganjuk",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Hobi : Traveling, Reading, Swimming",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Usia : 21 Tahun",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Pendidikan : S1 Sistem Informasi",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
