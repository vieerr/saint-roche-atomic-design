import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final VoidCallback onClick;
  final Color buttonColor;
  final IconData icon;

  const CounterButton({
    super.key,
    required this.onClick,
    required this.buttonColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Icon(
          icon,
          size: 24,
        ),
      ),
    );
  }
}
