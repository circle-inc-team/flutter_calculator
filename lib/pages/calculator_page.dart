import 'package:calculator/widgets/display_area.dart';
import 'package:flutter/material.dart';

import '../constants/button_key_list.dart';
import '../constants/operation_list.dart';
import '../utils/functions.dart';
import '../widgets/button_wrapper.dart';
import '../widgets/calculator_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String prev = '';
  String next = '';
  String operation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            DisplayArea(text: prev + operation + next),
            ButtonWrapper(
              children: [
                for (final value in buttonKeyList)
                  GridTile(
                    child: CalculatorButton(
                      next: next,
                      operation: operation,
                      prev: prev,
                      value: value,
                      onPressed: () {
                        // 計算結果を表示する
                        if (shouldCaluculate(
                          value: value,
                          next: next,
                          operation: operation,
                          prev: prev,
                        )) {
                          setState(() {
                            prev = calculate(
                              next: next,
                              operation: operation,
                              prev: prev,
                            ).toString().replaceAll('.0', '');
                            next = '';
                            operation = '';
                          });
                          return;
                        }
                        // クリアする
                        if (value == 'C') {
                          setState(() {
                            prev = '';
                            next = '';
                            operation = '';
                          });
                          return;
                        }
                        // 演算子を入力する
                        if (operationList.contains(value)) {
                          setState(() {
                            operation = value;
                          });
                          return;
                        }
                        // 値を入力する
                        if (operation.isEmpty) {
                          setState(() {
                            prev += value;
                          });
                        } else {
                          setState(() {
                            next += value;
                          });
                        }
                      },
                    ),
                  )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
