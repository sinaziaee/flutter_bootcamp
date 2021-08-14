import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  TextEditingController departureController = TextEditingController();
  TextEditingController flyingToController = TextEditingController();

  List typeList = ['One Way', 'Return'];
  List classList = ['Economy', 'Business', 'First'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Flight'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  myRowBuilder(
                      'Departing From', Icons.flight_land, departureController),
                  myRowBuilder(
                      'Flying to', Icons.flight_takeoff, flyingToController),
                  SizedBox(
                    height: 20,
                  ),
                  myCardBuilder('Type', typeList),
                  SizedBox(
                    height: 20,
                  ),
                  myCardBuilder('Class', classList),
                ],
              ),
            ),
          ),
          Card(),
        ],
      ),
    );
  }

  Widget myRowBuilder(
      String text, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text),
                Container(
                  height: 40,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myCardBuilder(String text, List list) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.blue,
              ),
            ),
            child: Row(
              children: [
                for (int i = 0; i < list.length; i++) ...[
                  if (i == 0) ...[
                    Expanded(
                      child: firstContainer(list[i]),
                    ),
                  ] else if (i == list.length - 1) ...[
                    Expanded(
                      child: lastContainer(list[i]),
                    ),
                  ] else ...[
                    Expanded(
                      child: middleContainer(list[i]),
                    ),
                  ]
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget firstContainer(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.blue,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget lastContainer(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget middleContainer(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
