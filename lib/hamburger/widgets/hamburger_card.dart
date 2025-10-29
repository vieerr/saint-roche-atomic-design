import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/styles/colors.dart';

class HamburgerCard extends StatelessWidget {
  final IconData icon;
  final String price;

  const HamburgerCard({
    super.key,
    required this.icon,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 145,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: UltraColors.primaryLight,
            width: 2,
          ),
          color: UltraColors.primaryDark,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.white,
            ),
            SizedBox(height: 12),
             Text(
               price,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
