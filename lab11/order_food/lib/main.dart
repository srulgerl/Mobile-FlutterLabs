// import 'package:flutter/material.dart';
// import 'features/order_food/screens/ExampleDragAndDrop.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: ExampleDragAndDrop(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }
import 'package:flutter/material.dart';
import "features/login/screens/loginscreen.dart";
import 'features/login/screens/visitscreen.dart';
import 'features/login/screens/signuoscreen.dart';
import 'features/order_food/screens/ExampleDragAndDrop.dart';
import 'features/order_food/screens/OrderScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const VisitScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/order_food': (context) => const ExampleDragAndDrop(),
        '/order': (context) => const OrderScreen(),
      },
    ),
  );
}
