import 'package:flutter/material.dart';
import 'package:home_challenge_08_solution/widgets/column_maker.dart';

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
              });
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ColumnMaker(
        list: list,
        onDeletePressed: (item) {
          deleter(item);
        },
      ),
    );
  }

  void deleter(String item) {
    setState(() {
      list.remove(item);
      // list.removeAt(item);
    });
  }
}
