import 'package:flutter/material.dart';
import 'package:p_08_api_connections/constants.dart';
import 'package:p_08_api_connections/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../constant_methods.dart';
import 'homescreen.dart';

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
                onPressed: () {
                  kNavigate(-1, context, 'login', '-1');
                },
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

  void register() async {
    String username = usernameController.text;
    String password = passwordController.text;
    String firstname = firstNameController.text;
    String lastname = lastNameController.text;
    String email = emailController.text;

    if (username.length == 0 ||
        password.length == 0 ||
        firstname.length == 0 ||
        lastname.length == 0 ||
        email.length == 0) {
      print('sth is null');
      return;
    }

    // 200 <= statusCode < 300 -> everything is OK
    // 300 <= statusCode < 400 -> redirect
    // 400 <= statusCode < 500 -> a problem from user side
    // 500 <= statusCode  -> a problem from server side
    print('requested page: $kBaseUrl/api/register/');
    http.Response response = await http.post(
      Uri.parse('$kBaseUrl/api/register/'),
      body: convert.json.encode({
        'username': username,
        'password': password,
        'first_name': firstname,
        'last_name': lastname,
        'email': email,
      }),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );
    print(response.statusCode);
    Map responseMap = convert.json.decode(response.body);
    print(responseMap);
    List result = await kSaveToLocal(responseMap, 'username');
    if (result.length != 0) {
      kNavigate(result[1], context, 'home', result[0]);
    }
  }

}
