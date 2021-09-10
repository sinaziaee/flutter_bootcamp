import 'package:flutter/material.dart';
import 'package:p_08_api_connections/constants.dart';
import 'package:p_08_api_connections/screens/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant_methods.dart';
import 'homescreen.dart';

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
    checkTokenExistence();
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
        title: Text('Login Screen'),
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
                onPressed: () {
                  kNavigate(-1, context, 'register', '-1');
                },
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

  void login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.length == 0 || password.length == 0) {
      print('username or password is null');
      return;
    }

    // 200 <= statusCode < 300 -> everything is OK
    // 300 <= statusCode < 400 -> redirect
    // 400 <= statusCode < 500 -> a problem from user side
    // 500 <= statusCode  -> a problem from server side

    print('requested page: $kBaseUrl/api/login/');

    http.Response response = await http.post(
      Uri.parse('$kBaseUrl/api/login/'),
      body: convert.json.encode({
        'username': username,
        'password': password,
      }),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );
    print(response.statusCode);
    Map responseMap = convert.json.decode(response.body);
    print(responseMap);
    List result = await kSaveToLocal(responseMap, 'user_name');
    if (result.length != 0) {
      kNavigate(result[1], context, 'home', result[0]);
    }
  }

  void checkTokenExistence() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.containsKey('token')) {
        String token = pref.getString('token') ?? '-1';
        int userId = pref.getInt('id') ?? -1;
        if(userId != -1){
          kNavigate(userId, context, 'home', token);
        }
      }
    } catch (e) {
      print(e);
      return;
    }
    return;
  }
}
