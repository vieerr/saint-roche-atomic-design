import 'package:flutter/material.dart';
import '../../commons/styles/colors.dart';

class SueldoCard extends StatelessWidget {
  final double sueldo;

  const SueldoCard({super.key, required this.sueldo});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          color: UltraColors.primaryDark,
        ),
        child: Column(
          children: [
            const Icon(
              Icons.wallet,
              size: 48,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            const Text(
              "Sueldo Neto",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "\$${sueldo.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
