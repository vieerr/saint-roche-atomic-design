import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/hamburger/widgets/counter_button.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void _incrementCount() {
    setState(() {
      count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CounterButton(
            onClick: _decrementCount,
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
          onClick: _incrementCount,
          buttonColor: Colors.green,
          icon: Icons.add,
        ),
      ],
    );
  }
}
