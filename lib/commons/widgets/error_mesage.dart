import 'package:flutter/material.dart';
import '../styles/colors.dart';

class ErrorMessage extends StatelessWidget {
  final String? errorText;

  const ErrorMessage({
    super.key,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    if (errorText == null || errorText!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: UltraColors.errorAccent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: UltraColors.errorAccent,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  errorText!,
                  style: TextStyle(
                    color: UltraColors.error,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}