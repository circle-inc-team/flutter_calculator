import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../utils/functions.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton({
    super.key,
    required this.prev,
    required this.next,
    required this.operation,
    required this.value,
    required this.onPressed,
  });
  final String prev;
  final String next;
  final String operation;
  final String value;
  final VoidCallback onPressed;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: disableOperation(
        operation: widget.operation,
        value: widget.value,
      )
          ? null
          : widget.onPressed,
      child: Text(
        widget.value,
        style: TextStyle(
          fontSize: 30,
          color: disableOperation(
            value: widget.value,
            operation: widget.operation,
          )
              ? primaryColor
              : Colors.white,
        ),
      ),
    );
  }
}
