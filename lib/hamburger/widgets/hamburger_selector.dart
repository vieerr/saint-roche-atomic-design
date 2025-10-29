import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/counter.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/hamburger_card.dart';

class HamburgerSelector extends StatelessWidget {
  final String price;
  final String name;
  const HamburgerSelector({
    super.key,
    required this.price,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HamburgerCard(icon: Icons.wallet, price: "\$$price"),
        SizedBox(width: 16),
        Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8,),
            Counter(),
          ],
        ),
      ],
    );
  }
}
