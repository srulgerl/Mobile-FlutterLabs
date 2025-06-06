import 'package:calculator/widgets/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Calculator()));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "0";

  void updateResult(String value) {
    setState(() {
      if (result == "0") {
        result = value;
      } else if (value == ".") {
        result = (result + value).toString();
      } else {
        result += value.toString();
      }
    });
  }

  void calculate(double n1, double n2, String operator) {
    if (operator == '+') {
      result = (n1 + n2).toString();
    } else if (operator == '-') {
      result = (n1 - n2).toString();
    } else if (operator == 'x') {
      result = (n1 * n2).toString();
    } else if (operator == '%') {
      result = (n1 % n2).toString();
    } else if (operator == '/') {
      if (n2 != 0) {
        result = (n1 / n2).toString();
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10, bottom: 60, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 100),
          Wrap(
            spacing: 15.0,
            runSpacing: 15.0,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.end,
            children: [
              Buttons("C", true, (value) {
                setState(() {
                  result = "0";
                });
              }),
              Buttons("%", true, updateResult),
              Buttons("DEL", true, (value) {
                setState(() {
                  if (result.length > 1) {
                    result = result.substring(0, result.length - 1);
                  } else {
                    result = "0";
                  }
                });
              }),
              Buttons("/", true, updateResult),
              Buttons("7", false, updateResult),
              Buttons("8", false, updateResult),
              Buttons("9", false, updateResult),
              Buttons("x", true, updateResult),
              Buttons("4", false, updateResult),
              Buttons("5", false, updateResult),
              Buttons("6", false, updateResult),
              Buttons("-", true, updateResult),
              Buttons("1", false, updateResult),
              Buttons("2", false, updateResult),
              Buttons("3", false, updateResult),
              Buttons("+", true, updateResult),
              Buttons("00", false, updateResult),
              Buttons("0", false, updateResult),
              Buttons(".", true, updateResult),
              Buttons("=", true, (value) {
                String op =
                    result.contains('+')
                        ? '+'
                        : result.contains('-')
                        ? '-'
                        : result.contains('x')
                        ? 'x'
                        : result.contains('/')
                        ? '/'
                        : result.contains('%')
                        ? '%'
                        : '';
                List<String> parts = result.split(op);
                if (parts.length == 2) {
                  double n1 = double.parse(parts[0]);
                  double n2 = double.parse(parts[1]);

                  calculate(n1, n2, op);
                  setState(() {});
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}
