import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons(this.name, this.operator, this.onPressed, {super.key});
  final String name;
  final bool operator;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: 85,
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor:
                operator
                    ? Colors.black
                    : const Color.fromARGB(255, 226, 226, 226),
          ),
          onPressed: () {
            onPressed(name);
          },
          child: Text(
            name,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: !operator ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
