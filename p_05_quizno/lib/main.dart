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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.07,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      width: 4,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      questionContainer(1),
                      questionContainer(2),
                      questionContainer(3),
                      questionContainer(4),
                      questionContainer(5),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Text(
                  'Where is the correct place to insert a JS alert?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                answerContainer('This is the answer 1, This is the answer 1, This is the answer 1 This is the answer 1'),
                SizedBox(
                  height: size.height * 0.03,
                ),
                answerContainer('This is the answer 2'),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: kLightBlueColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
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
      padding: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
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
            Expanded(
              child: Text(
                '$answer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
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
