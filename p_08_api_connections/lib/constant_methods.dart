import 'package:flutter/material.dart';
import 'package:p_08_api_connections/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/homescreen.dart';
import 'screens/sign_up_screen.dart';

Future<List> kSaveToLocal(Map map, String usernameKey) async {
  try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('username', map[usernameKey]);
    await pref.setInt('id', map['id']);
    await pref.setString(
        'fullname', '${map['first_name']} ${map['last_name']}');
    String token = 'Token ${map['token']}';
    await pref.setString('token', token);
    return [token, map['id']];
  } catch (e) {
    print(e);
    return [];
  }
}

void kNavigate(int user_id, BuildContext context, String type, String token) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        if (type == 'home') {
          return HomeScreen(
            token: token, userId: user_id,
          );
        }
        else if (type == 'login'){
          return LoginScreen();
        }
        return SignUpScreen();
      },
    ),
  );
}

Future<bool> kSignOut() async{
  try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool status = await pref.clear();
    return status;
  } catch (e) {
    print(e);
    return false;
  }
}
