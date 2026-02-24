import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';
// Importa tu archivo de home_page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}