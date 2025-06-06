import 'package:flutter/material.dart';
import 'ShooOrhilt.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: BodyContainer()),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 5, 109, 60),
            Color.fromARGB(255, 176, 204, 202),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(child: ShooOrhilt()),
    );
  }
}
