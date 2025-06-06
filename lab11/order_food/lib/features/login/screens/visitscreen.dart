import 'package:flutter/material.dart';

class VisitScreen extends StatelessWidget {
  const VisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello There!",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              "Automatic identity verification which enables you to verify your identity",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            Image.asset('order_food/assets/login_img.jpg', width: 250),

            const SizedBox(height: 32),

            Column(
              children: [
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),

                      child: Text('Login'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                SizedBox(
                  width: 400,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),

                      child: Text('Sign up'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
