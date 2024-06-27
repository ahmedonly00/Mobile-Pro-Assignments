import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20.0),
            backgroundColor: const Color.fromARGB(255, 10, 122, 177),
            shape: const CircleBorder(),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            setState(() {
              if (buttonText == "CLEAR") {
                _output = "0";
                num1 = 0.0;
                num2 = 0.0;
                operand = "";
              } else if (buttonText == "+" ||
                  buttonText == "-" ||
                  buttonText == "*" ||
                  buttonText == "/") {
                num1 = double.parse(output);
                operand = buttonText;
                _output = "0";
              } else if (buttonText == ".") {
                if (_output.contains(".")) {
                  return;
                } else {
                  _output = _output + buttonText;
                }
              } else if (buttonText == "=") {
                num2 = double.parse(output);

                if (operand == "+") {
                  _output = (num1 + num2).toString();
                }
                if (operand == "-") {
                  _output = (num1 - num2).toString();
                }
                if (operand == "*") {
                  _output = (num1 * num2).toString();
                }
                if (operand == "/") {
                  _output = (num1 / num2).toString();
                }

                num1 = 0.0;
                num2 = 0.0;
                operand = "";
              } else {
                _output = _output + buttonText;
              }

              setState(() {
                output = double.parse(_output).toStringAsFixed(2);
              });
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
