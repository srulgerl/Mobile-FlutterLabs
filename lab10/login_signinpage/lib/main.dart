import 'package:flutter/material.dart';
import "loginscreen.dart";
import 'visitscreen.dart';
import 'signuoscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const VisitScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => SignUpScreen(),
      },
    ),
  );
}
