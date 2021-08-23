import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/body_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 4;

  List list = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
                list.add('Item $counter');
                add();
              });
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: bodyMaker(),
    );
  }

  Widget bodyMaker() {
    if (list.isEmpty) {
      return Center(
        child: Text(
          'No Items found',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      );
    } //
    else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return BodyContainer(
            item: list[index],
            onDeletePressed: () {
              setState(() {
                list.remove(list[index]);
              });
            },
          );
        },
        itemCount: list.length,
      );
    }
  }

  void add() async {
    counter++;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(counter.toString(), 'item $counter');
    for (var each in pref.getKeys()) {
      print(each);
    }
  }
}
