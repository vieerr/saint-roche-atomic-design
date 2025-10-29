import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/counter.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/hamburger_card.dart';

class HamburgerSelector extends StatelessWidget {
  final String price;
  final String name;
  final int count;
  final IconData icon;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const HamburgerSelector({
    super.key,
    required this.price,
    required this.name,
    required this.count,
    required this.icon,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HamburgerCard(icon: icon, price: "\$$price"),
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
            Counter(
              count: count,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
          ],
        ),
      ],
    );
  }
}
