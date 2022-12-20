import 'package:flutter/material.dart';

import '../constants/color.dart';

class ButtonWrapper extends StatelessWidget {
  const ButtonWrapper({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height < 700 ? 420 : 560,
      color: primaryColor,
      child: GridView.count(
        childAspectRatio: size.height < 700 ? 0.9 : 0.7,
        crossAxisCount: 4,
        children: children,
      ),
    );
  }
}
