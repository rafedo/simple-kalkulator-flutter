import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonText;
  final Function callback;

  CalculatorButton({required this.buttonText, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      child: SizedBox(
          height: 80.0,
          width: 80.0,
          child: RoundButton(
            text: buttonText,
            color: Colors.transparent,
            textColor: Colors.white,
            onTap: () => callback(buttonText),
          )),
    );
  }
}

class RoundButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function() onTap;

  RoundButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  _RoundButtonState createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapCancel: () => setState(() => _isPressed = false),
        onTapUp: (_) => setState(() => _isPressed = false),
        splashColor: widget.color,
        highlightColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: _isPressed ? widget.color : Colors.transparent,
            border: Border.all(
              color: widget.color,
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 24,
              color: _isPressed ? Colors.white : widget.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
