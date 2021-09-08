import 'package:flutter/material.dart';
import 'package:p_08_api_connections/constants.dart';
import 'package:p_08_api_connections/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController firstNameController;

  late TextEditingController lastNameController;

  late TextEditingController usernameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    usernameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
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
                controller: firstNameController,
                decoration: kCustomTextfieldDecoration.copyWith(
                  hintText: 'First Name',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: lastNameController,
                decoration: kCustomTextfieldDecoration.copyWith(
                  hintText: 'Last Name',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: emailController,
                decoration: kCustomTextfieldDecoration.copyWith(
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: 5,
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
                onPressed: register,
                child: Text('Register'),
              ),
              TextButton(
                onPressed: gotoLoginScreen,
                child: Text(
                  'goto login',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {}

  void gotoLoginScreen() {
    Navigator.pushReplacement (
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ),
    );
  }
}
