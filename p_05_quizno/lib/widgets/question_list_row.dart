import 'package:flutter/material.dart';
import 'package:p_05_quizno/models/question_db.dart';

import 'question_container.dart';

class QuestionListRow extends StatelessWidget {
  final List statusList;
  final int currentQuestionNumber;

  QuestionListRow(this.currentQuestionNumber, this.statusList);

  final QuestionDb db = QuestionDb();

  List<Widget> widgetsList = [];

  @override
  Widget build(BuildContext context) {
    widgetsList.clear();
    for (int i = 0; i < db.getSize(); i++) {
      widgetsList.add(
        QuestionContainer(
          i + 1,
          statusList,
          currentQuestionNumber,
          db.getSize(),
        ),
      );
    }
    return Row(
      children: widgetsList,
    );
  }
}
