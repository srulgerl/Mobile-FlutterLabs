// ignore_for_file: dead_code, unnecessary_null_comparison, use_build_context_synchronously, avoid_print, prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/home.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/repository/repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _changeButton = false;
  final _formKey = GlobalKey<FormState>();
  final MyRepository repository = MyRepository();

  String _userName = "mor_2314";
  String _userPass = "83r5^_";

  Future<void> moveToHome(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _changeButton = true);

    try {
      final String token = await repository.login(_userName, _userPass);

      await Provider.of<Global_provider>(context, listen: false)
          .saveToken(token);

      Provider.of<Global_provider>(context, listen: false)
          .saveUsernameAndpass(_userName, _userPass);

      final userId = await repository.getUserId(_userName, _userPass);
      Provider.of<Global_provider>(context, listen: false).saveUserId(userId);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } catch (e) {
      setState(() => _changeButton = false);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Text("Тавтай морил",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                    child: Column(
                      children: [
                        SizedBox(
                          width: true ? 500 : MediaQuery.of(context).size.width,
                          child: TextFormField(
                            initialValue: _userName,
                            onChanged: (value) {
                              _userName = value;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Нэрээ оруулна уу",
                                label: Text("Нэр:")),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Хоосон байж болохгүй";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: true ? 500 : MediaQuery.of(context).size.width,
                          child: TextFormField(
                            initialValue: _userPass,
                            onChanged: (value) {
                              _userPass = value;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Нууц үг оруул",
                              label: Text("Нууц үг"),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Хоосон байж болохгүй";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(32.0),
                          color: Colors.deepPurple,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              color: Colors.transparent,
                              duration: Duration(seconds: 1),
                              height: 50,
                              width: _changeButton ? 50 : 150,
                              alignment: Alignment.center,
                              child: _changeButton
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Нэвтрэх",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        )));
  }
}
