import 'package:flutter/material.dart';
import '../widgets/calculator_display.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _input = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _input = "";
        _num1 = 0.0;
        _num2 = 0.0;
        _operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "x" ||
          buttonText == "/") {
        _num1 = double.parse(_input);
        _operand = buttonText;
        _input = "";
        _output = "0";
      } else if (buttonText == ".") {
        if (_input.contains(".")) {
          return;
        } else {
          _input = _input + buttonText;
        }
      } else if (buttonText == "=") {
        _num2 = double.parse(_input);
        if (_operand == "+") {
          _output = (_num1 + _num2).toString();
        } else if (_operand == "-") {
          _output = (_num1 - _num2).toString();
        } else if (_operand == "x") {
          _output = (_num1 * _num2).toString();
        } else if (_operand == "/") {
          _output = (_num1 / _num2).toString();
        }
        _num1 = double.parse(_output);
        _num2 = 0.0;
        _operand = "";
        _input = _output;
      } else {
        _input = _input + buttonText;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CalculatorDisplay(output: _output),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  buttonText: "7",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "8",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "9",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "/",
                  callback: buttonPressed,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  buttonText: "4",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "5",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "6",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "x",
                  callback: buttonPressed,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  buttonText: "1",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "2",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "3",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "-",
                  callback: buttonPressed,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  buttonText: ".",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "0",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "00",
                  callback: buttonPressed,
                ),
                CalculatorButton(
                  buttonText: "+",
                  callback: buttonPressed,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CalculatorButton(
                  buttonText: "C",
                  callback: buttonPressed,
                ),
                SizedBox(
                  width: 16.0,
                ),
                CalculatorButton(
                  buttonText: "=",
                  callback: buttonPressed,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
