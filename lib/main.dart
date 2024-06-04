import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        display = '0';
        num1 = 0;
        num2 = 0;
        operand = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        num1 = double.parse(display);
        operand = buttonText;
        display = '0';
      } else if (buttonText == '=') {
        num2 = double.parse(display);

        if (operand == '+') {
          display = (num1 + num2).toString();
        } else if (operand == '-') {
          display = (num1 - num2).toString();
        } else if (operand == '*') {
          display = (num1 * num2).toString();
        } else if (operand == '/') {
          display = (num1 / num2).toString();
        }

        num1 = 0;
        num2 = 0;
        operand = '';
      } else {
        display += buttonText;
      }

      display = double.parse(display).toString();
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        child: Text(buttonText, style: TextStyle(fontSize: 20)),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Máy tính cơ bản'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              display,
              style: TextStyle(fontSize: 48),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('C'),
                  buildButton('0'),
                  buildButton('='),
                  buildButton('+'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
