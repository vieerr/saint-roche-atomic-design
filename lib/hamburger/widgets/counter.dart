import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/counter_button.dart';

class Counter extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int count;

  const Counter({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CounterButton(
          onClick: onDecrement,
          buttonColor: Colors.red,
          icon: Icons.remove,
        ),

        SizedBox(width: 15),

        Container(
          width: 70,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$count',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),

        SizedBox(width: 15),

        CounterButton(
          onClick: onIncrement,
          buttonColor: Colors.green,
          icon: Icons.add,
        ),
      ],
    );
  }
}