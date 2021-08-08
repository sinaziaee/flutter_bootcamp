import 'package:flutter/material.dart';
import 'package:p_05_quizno/constants.dart';
import 'package:p_05_quizno/models/question.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Size size;

  int questionNumber = 0;
  bool isOnePressed = false;

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
                    children: questionListRow(),
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
                  testList[questionNumber].question,
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
                answerContainer(testList[questionNumber].answer1, 1),
                SizedBox(
                  height: size.height * 0.03,
                ),
                answerContainer(testList[questionNumber].answer2, 2),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Material(
                  color: kLightBlueColor,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      onNextPressed();
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
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

  List<Widget> questionListRow() {
    List<Widget> widgetsList = [];
    for (int i = 0; i < testList.length; i++) {
      widgetsList.add(questionContainer(i + 1));
    }
    return widgetsList;
  }

  Widget questionContainer(int num) {
    int temp = num - 1;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (temp == questionNumber) ? kPurpleColor : Colors.grey,
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

  Widget answerContainer(String answer, int num) {
    return InkWell(
      onTap: () {
        if(num == 1){
          setState(() {
            isOnePressed = true;
          });
        }
        else if(num == 2){
          setState(() {
            isOnePressed = false;
          });
        }
        else {
          // handle later
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
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
                color: (isOnePressed && num == 1) ? kLightBlueColor : Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onNextPressed() {
    if (questionNumber + 1 >= 10) {
      // pass
    } //
    else {
      setState(() {
        questionNumber++;
      });
    }
    print(questionNumber);
  }
}
