import 'package:flutter/material.dart';
import 'package:p_05_quizno/constants.dart';

class ResultScreen extends StatelessWidget {

  List<int> resultList;

  ResultScreen(this.resultList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlueColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('right: ${resultList[0]}'),
            Text('wrong: ${resultList[1]}'),
            Text('white: ${resultList[2]}'),
          ],
        ),
      ),
    );
  }
}
