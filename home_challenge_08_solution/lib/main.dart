import 'package:flutter/material.dart';

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
  // List<int> list = [
  //   1,
  //   2,
  //   3,
  //   4,
  // ];

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
      body: SingleChildScrollView(
        child: Column(
          children: columnMaker(),
        ),
      ),
    );
  }

  List<Widget> columnMaker() {
    List<Widget> widgetsList = [];
    for (int i = 0; i < list.length; i++) {
      widgetsList.add(bodyContainer(list[i]));
    }
    return widgetsList;
  }

  Widget bodyContainer(String item) {
    return Container(
      color: Colors.yellowAccent,
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  list.remove(item);
                  // list.removeAt(item);
                });
              },
              iconSize: 60,
              icon: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
            Spacer(),
            Text(
              // 'Item $i',
              item,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
