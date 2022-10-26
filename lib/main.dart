import 'package:flutter/material.dart';
import 'package:my_coctail_bar/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Coctail Bar',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color.fromARGB(255, 231, 221, 221),
      ),
      home: const HomePage(),
    );
  }
}