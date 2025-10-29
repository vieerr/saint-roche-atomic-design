import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/counter.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/hamburger_selector.dart';
import '../../commons/widgets/ultra_app_bar.dart';

class HamburgerScreen extends StatefulWidget {
  const HamburgerScreen({super.key});

  @override
  State<HamburgerScreen> createState() => _HamburgerScreenState();
}

class _HamburgerScreenState extends State<HamburgerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UltraAppBar(appBarName: "El náufrago satisfecho"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            HamburgerSelector(
              name: "Sencilla",
              price: "20",
            ),
            SizedBox(height: 12,),
            HamburgerSelector(
              name: "Doble",
              price: "25",
            ),
            SizedBox(height: 12,),
            HamburgerSelector(
              name: "Triple",
              price: "28",
            ),
            SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }
}
