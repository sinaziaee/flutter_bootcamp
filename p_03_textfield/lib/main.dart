import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String typedString = 's';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(typedString),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 40,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(),
                        hintText: 'type here',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      cursorColor: Colors.black,
                      onChanged: (String value){
                        typedString = value;
                        print(typedString);
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  void temp(){
    typedString = 'sina';
  }
}

