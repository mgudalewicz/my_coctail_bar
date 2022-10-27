import 'package:flutter/material.dart';
import 'package:my_coctail_bar/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_coctail_bar/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDepenedencies();
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
