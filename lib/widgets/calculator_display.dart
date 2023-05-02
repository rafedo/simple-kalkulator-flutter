import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  final String output;

  CalculatorDisplay({required this.output});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
      child: Text(
        output,
        style: TextStyle(fontSize: 48.0),
      ),
    );
  }
}
