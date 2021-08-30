import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:p_07/models/todo.dart';
import 'package:p_07/screens/home_screen.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData.dark(),
    );
  }
}

