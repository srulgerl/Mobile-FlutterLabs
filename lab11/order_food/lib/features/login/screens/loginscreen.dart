import 'package:flutter/material.dart';
import '/features/order_food/models/customer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  Customer loggedcustomer = Customer(
    userId: 1,
    gmail: "saruul@gmail.com",
    name: 'Saruul',
    imageProvider: const NetworkImage(
      'https://docs.flutter.dev'
      '/cookbook/img-files/effects/split-check/Avatar1.jpg',
    ),
  );

  void login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushNamed(context, "/order_food", arguments: loggedcustomer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Welcome back! Login with your credentials",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: InputDecoration(
                      hintText: 'abc@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                    ),
                    validator: (v) {
                      if (v == null) return 'Имэйл оруулна уу';
                      if (!v.contains('@')) return 'Зөв имэйл оруулна уу';
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 16),

                  const Text('Passwords'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passCtrl,
                    decoration: InputDecoration(
                      hintText: '********',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Нууц үг оруулна уу';
                      if (v.length < 6) return '6-с дээш тэмдэгттэй байх ёстой';
                      return null;
                    },
                    obscureText: true,
                  ),
                ],
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: login,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Login"),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
