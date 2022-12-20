import 'package:flutter/material.dart';

class DisplayArea extends StatelessWidget {
  const DisplayArea({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.grey.shade200,
        padding: const EdgeInsets.only(
          right: 30,
          left: 30,
          bottom: 30,
        ),
        alignment: Alignment.bottomRight,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
