import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/hamburger/model/ham_model.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/counter.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/hamburger_card.dart';

class HamburgerSelector extends StatelessWidget {
  final HamburgerModel hamItem;
  final IconData icon;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const HamburgerSelector({
    super.key,
    required this.hamItem,
    required this.icon,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HamburgerCard(icon: icon, price: "\$${hamItem.hamburger.price}"),
        SizedBox(width: 16),
        Column(
          children: [
            Text(
              hamItem.hamburger.name,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8,),
            Counter(
              count: hamItem.quantity,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
          ],
        ),
      ],
    );
  }
}
