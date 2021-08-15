import 'package:flutter/material.dart';
import 'package:p_05_quizno/models/question.dart';
import 'package:p_05_quizno/models/question_db.dart';
import 'package:p_05_quizno/widgets/animation_bar.dart';
import 'package:p_05_quizno/widgets/answer_container.dart';
import 'package:p_05_quizno/widgets/custom_button.dart';
import 'package:p_05_quizno/widgets/question_container.dart';
import 'package:p_05_quizno/widgets/question_list_row.dart';

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
                MyAnimationBar(
                  animation.value,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: QuestionListRow(currentQuestionNumber, statusList),
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
                AnswerContainer(
                  (isOnePressed) ? kLightBlueColor : Colors.white,
                  db.getQuestion(currentQuestionNumber).answer1,
                  () {
                    onAnswerPressed(1);
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                AnswerContainer(
                  (!isOnePressed) ? kLightBlueColor : Colors.white,
                  db.getQuestion(currentQuestionNumber).answer2,
                  () {
                    onAnswerPressed(2);
                  },
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                CustomButton(
                  kLightBlueColor,
                  'Next',
                  () {
                    controller.reset();
                    onNextPressed(false);
                    controller.forward();
                  },
                  150,
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

  void onAnswerPressed(int num) {
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
  }
}
