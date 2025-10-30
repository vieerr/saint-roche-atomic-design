import 'package:flutter/material.dart';

import '../styles/colors.dart';

class UltraButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? elevation;
  final bool enabled;

  UltraButton({
    super.key,
    this.elevation = 2.0,
    this.enabled = true,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: UltraColors.primary,
          foregroundColor: Colors.white,
          elevation: elevation,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: UltraColors.primaryLight.withValues(alpha: 0.5),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}