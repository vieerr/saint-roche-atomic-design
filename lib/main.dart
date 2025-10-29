import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/bill/view/bill_result_screen.dart';
import 'package:saint_roche_atomic_design/bill/view/bill_screen.dart';
import 'package:saint_roche_atomic_design/hamburger/view/ham_screen.dart';
import 'package:saint_roche_atomic_design/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nav App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen[300]!),
      ),
      routes: {
        '/': (context) => const Home(),
        '/bill': (context) => const BillScreen(),
        '/bill/result': (context) => const BillResultScreen(),
        '/products': (context) => Placeholder(),
        '/teacher': (context) => Placeholder(),
        '/numbers': (context) => Placeholder(),
        '/hamburger': (context) => HamburgerScreen(),
      },
      initialRoute: '/',
    );
  }
}
