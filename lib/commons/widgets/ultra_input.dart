import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/styles/colors.dart';

class UltraInput extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const UltraInput({
    super.key,
    required this.label,
    this.hint,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: UltraColors.primaryDark,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              prefixIcon: icon != null ? Icon(icon) : null,
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              focusColor: UltraColors.primaryDark,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: UltraColors.primary,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: UltraColors.primary.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: UltraColors.primary,
                  width: 1.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}