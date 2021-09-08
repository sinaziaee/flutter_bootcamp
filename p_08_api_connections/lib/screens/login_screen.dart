import 'package:flutter/material.dart';
import 'package:p_08_api_connections/constants.dart';
import 'package:p_08_api_connections/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: usernameController,
                decoration: kCustomTextfieldDecoration.copyWith(
                  hintText: 'Username',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: kCustomTextfieldDecoration.copyWith(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: login,
                child: Text('Login'),
              ),
              TextButton(
                onPressed: gotoRegisterScreen,
                child: Text(
                  'goto register',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {}

  void gotoRegisterScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SignUpScreen();
        },
      ),
    );
  }
}
