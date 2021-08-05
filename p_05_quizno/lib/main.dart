import 'package:flutter/material.dart';
import 'package:p_05_quizno/constants.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDarkBlueColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 4,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                questionContainer(1),
                questionContainer(2),
                questionContainer(3),
                questionContainer(4),
                questionContainer(5),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Where is the correct place to insert a JS alert?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            answerContainer('This is the answer 1, This is the answer 1, This is the answer 1'),
            SizedBox(
              height: 20,
            ),
            answerContainer('This is the answer 2'),
          ],
        ),
      ),
    );
  }

  Widget questionContainer(int num) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kPurpleColor,
      ),
      child: Center(
        child: Text(
          '$num',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget answerContainer(String answer) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      height: 60,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 4,
          color: Colors.blue.shade800,
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              '$answer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Spacer(),
            Icon(
              Icons.brightness_1_rounded,
              color: kLightBlueColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
