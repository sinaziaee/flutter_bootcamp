import 'package:flutter/material.dart';
import 'package:p_05_quizno/models/question.dart';

import '../constants.dart';

class QuestionContainer extends StatelessWidget {

  final int num;
  final List statusList;
  final int currentQuestionNumber;
  final int testListSize;

  QuestionContainer(this.num, this.statusList, this.currentQuestionNumber, this.testListSize);

  // statusList -> 0, true, false
  Color color = Colors.grey;
  int temp = 0;

  @override
  Widget build(BuildContext context) {
    temp = num - 1;
    if (temp == currentQuestionNumber) {
      if (temp == testListSize - 1 && statusList[temp] != 0) {
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
}
