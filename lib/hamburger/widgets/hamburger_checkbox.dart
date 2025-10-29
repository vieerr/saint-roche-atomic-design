import 'package:flutter/material.dart';
import 'package:saint_roche_atomic_design/commons/styles/colors.dart';

class HamburgerCheckbox extends StatefulWidget {
  final String label;
  final ValueChanged<bool>? onChanged;

  const HamburgerCheckbox({
    super.key,
    required this.label,
    this.onChanged,
  });

  @override
  State<HamburgerCheckbox> createState() => _HamburgerCheckboxState();
}

class _HamburgerCheckboxState extends State<HamburgerCheckbox> {
  bool _isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            // al presionar el checkbox se actualiza el
            // estado interno del widget (_isChecked)
            onTap: () {
              setState(() => _isChecked = !_isChecked);
              // Se notifica al padre que llame la función
              // onChanged() con el valor actual de _isChecked
              widget.onChanged?.call(_isChecked);
            },
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: _isChecked
                      ? UltraColors.primary
                      : Colors.grey.shade400,
                  width: 2.0,
                ),
                color: _isChecked
                    ? UltraColors.primary
                    : Colors.transparent,
              ),
              child: _isChecked ?
                Icon(
                  Icons.check,
                  size: 18.0,
                  color: Colors.white,
                )
                  : null,
            ),
          ),

          SizedBox(width: 12,),

          Expanded(
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

