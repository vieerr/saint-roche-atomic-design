import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/styles/colors.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onClick;

  const HomeButton({
        super.key,
        required this.title,
        required this.icon,
        required this.onClick,
      });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: UltraColors.primaryLight,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: UltraColors.primaryLight.withValues(alpha: 0.5),
              blurRadius: 4,
              offset: Offset(2.5, 5),
            ),
          ],
          border: Border.all(
            color: UltraColors.primary,
            width: 2.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 65,
              color: UltraColors.primary,
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: UltraColors.primary,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
