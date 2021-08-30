import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoresScreen extends StatelessWidget {
  late SharedPreferences pref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores screen'),
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data);
            List<String> resultList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: resultList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('$index: ${resultList[index]}'),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<String>> loadData() async {
    pref = await SharedPreferences.getInstance();
    List<String> itemList = pref.getStringList('results') ?? [];
    return itemList;
  }
}
