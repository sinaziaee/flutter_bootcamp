import 'package:flutter/material.dart';
import 'package:p_05_quizno/models/question.dart';
import 'package:p_05_quizno/models/question_db.dart';
import 'package:p_05_quizno/widgets/question_container.dart';

import '../constants.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  late Size size;

  ScrollController scrollController = ScrollController();

  int currentQuestionNumber = 0;
  bool isOnePressed = false;
  QuestionDb db = QuestionDb();
  List statusList = [];

  @override
  void initState() {

    super.initState();
    for (int i = 0; i < db.getSize(); i++) {
      statusList.add(0);
    }
    controller =
        AnimationController(duration: Duration(seconds: 10), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if ((animation.value * 100).round() >= 98) {
            onNextPressed(true);
            if (controller.isAnimating) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          my_navigator();
        },
        child: Icon(Icons.nat),
      ),
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
                  controller: scrollController,
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
                    db.getQuestion(currentQuestionNumber).question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                answerContainer(db.getQuestion(currentQuestionNumber).answer1, 1),
                SizedBox(
                  height: size.height * 0.03,
                ),
                answerContainer(db.getQuestion(currentQuestionNumber).answer2, 2),
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
    for (int i = 0; i < db.getSize(); i++) {
      widgetsList
          .add(QuestionContainer(i + 1, statusList, currentQuestionNumber, db.getSize()));
    }
    return widgetsList;
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
    scrollController.animateTo(currentQuestionNumber * 50.0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);

    if (isFromTimer == true) {
      statusList[currentQuestionNumber] = false;
    } else {
      checkAnswer();
    }
    if (currentQuestionNumber + 1 >= 10) {
      my_navigator();
    } //
    else {
      currentQuestionNumber++;
    }
    setState(() {});
  }

  void checkAnswer() {
    int myAnswer = (isOnePressed) ? 1 : 2;
    bool status = db.getQuestion(currentQuestionNumber).isRight(myAnswer);
    statusList[currentQuestionNumber] = status;
  }

  void my_navigator() async {
    // stopping timer
    controller.reset();
    // calculate user grade
    List<int> resultList = grader();
    // navigate to result screen
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ResultScreen(resultList);
      }),
    );

    reseter();

    // Navigator.pop(context);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) {
    //     return ResultScreen(resultList);
    //   }),
    // );
  }

  List<int> grader() {
    int rightAnswers = 0;
    int wrongAnswers = 0;
    int whiteAnswers = 0;

    for (var each in statusList) {
      if (each == true) {
        rightAnswers++;
      } else if (each == false) {
        wrongAnswers++;
      } else {
        whiteAnswers++;
      }
    }
    return [rightAnswers, wrongAnswers, whiteAnswers];
  }

  void reseter() {
    currentQuestionNumber = 0;
    isOnePressed = false;
    statusList.clear();
    for (int i = 0; i < db.getSize(); i++) {
      statusList.add(0);
    }
    controller.forward();
    scrollController.animateTo(currentQuestionNumber * 50.0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {});
  }
}
