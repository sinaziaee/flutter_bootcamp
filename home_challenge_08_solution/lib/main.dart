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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        actions: [
          IconButton(
            onPressed: () async {
              await add();
              setState(() {});
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data);
            List<String> resultList = snapshot.data;
            int counter = resultList.length;
            return bodyMaker(resultList, counter);
          } //
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget bodyMaker(List<String> list, int count) {
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
            onDeletePressed: () async {
              await delete(list[index]);
              setState(() {});
            },
          );
        },
        itemCount: count,
      );
    }
  }

  Future<bool> add() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      int counter = pref.getInt('counter') ?? 0;
      counter++;
      List<String> itemList = pref.getStringList('items') ?? [];
      itemList.add('item $counter');
      await pref.setInt('counter', counter);
      await pref.setStringList('items', itemList);
      print(pref.getInt('counter') ?? 0);
      print(pref.getStringList('items') ?? 0);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<String>> loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> itemList = pref.getStringList('items') ?? [];
    return itemList;
  }

  Future<bool> delete(String item) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String> itemList = pref.getStringList('items') ?? [];
      itemList.remove(item);
      await pref.setStringList('items', itemList);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
