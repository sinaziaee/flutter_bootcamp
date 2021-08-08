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

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;

  late Size size;

  int currentQuestionNumber = 0;
  bool isOnePressed = false;

  List statusList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < testList.length; i++) {
      statusList.add(0);
    }
    controller = AnimationController(duration: Duration(seconds: 10), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)..addListener(() {
      setState(() {
        if((animation.value * 100).round() >= 98){
          onNextPressed(true);
          if(controller.isAnimating){
            controller.reset();
            controller.forward();
          }
        }
      });
    });
    controller.forward();
  }

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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: LinearProgressIndicator(
                      value: animation.value,
                      backgroundColor: kDarkBlueColor,
                      valueColor: AlwaysStoppedAnimation(Colors.red),
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
                Container(
                  height: size.height * 0.25,
                  child: Text(
                    testList[currentQuestionNumber].question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                answerContainer(testList[currentQuestionNumber].answer1, 1),
                SizedBox(
                  height: size.height * 0.03,
                ),
                answerContainer(testList[currentQuestionNumber].answer2, 2),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Material(
                  color: kLightBlueColor,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      controller.reset();
                      onNextPressed(false);
                      controller.forward();
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
    // statusList -> 0, true, false
    Color color = Colors.grey;
    int temp = num - 1;
    int size = testList.length;
    if (temp == currentQuestionNumber) {
      if (temp == size - 1 && statusList[temp] != 0) {
        if (statusList[temp] == true) {
          color = Colors.green;
        } //
        else if (statusList[temp] == false) {
          color = Colors.red;
        } else {
          // pass
        }
      } else {
        color = kPurpleColor;
      }
    } else {
      if (statusList[temp] == true) {
        color = Colors.green;
      } //
      else if (statusList[temp] == false) {
        color = Colors.red;
      } else {
        // pass
      }
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
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
        if (num == 1) {
          setState(() {
            isOnePressed = true;
          });
        } else if (num == 2) {
          setState(() {
            isOnePressed = false;
          });
        } else {
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
                color: (isOnePressed && num == 1 || !isOnePressed && num == 2)
                    ? kLightBlueColor
                    : Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onNextPressed(bool isFromTimer) {
    if(isFromTimer == true){
      statusList[currentQuestionNumber] = false;
    }
    else{
      checkAnswer();
    }
    if (currentQuestionNumber + 1 >= 10) {
      controller.reset();
      controller.dispose();
    } //
    else {
      currentQuestionNumber++;
    }
    setState(() {});
  }

  void checkAnswer() {
    int myAnswer = (isOnePressed) ? 1 : 2;
    bool status = testList[currentQuestionNumber].isRight(myAnswer);
    statusList[currentQuestionNumber] = status;
  }
}

// if (num == 1) ...[
//   if (isOnePressed) ...[
//     Icon(
//       Icons.brightness_1_rounded,
//       color: kLightBlueColor,
//       size: 30,
//     ),
//   ] else ...[
//     Icon(
//       Icons.brightness_1_rounded,
//       color: Colors.white,
//       size: 30,
//     ),
//   ]
// ] else ...[
//   if (isOnePressed) ...[
//     Icon(
//       Icons.brightness_1_rounded,
//       color: Colors.white,
//       size: 30,
//     ),
//   ] else ...[
//     Icon(
//       Icons.brightness_1_rounded,
//       color: kLightBlueColor,
//       size: 30,
//     ),
//   ]
// ],