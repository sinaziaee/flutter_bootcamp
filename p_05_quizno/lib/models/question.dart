class Question {
  String question;
  String answer1;
  String answer2;

  // right answer 1-> answer1, 2-> answer2
  int trueAnswer;

  // constructor
  Question(this.question, this.answer1, this.answer2, this.trueAnswer);

  bool isRight(int num) {
    if (num != 1 || num != 2) {
      return false;
    }
    // true answer -> 1
    if (trueAnswer == 1) {
      if (num == 1) {
        return true;
      } //
      else {
        return false;
      }
    } // true answer -> 2
    else {
      if (num == 2) {
        return true;
      } //
      else {
        return false;
      }
    }
  }
}

List test = [
  Question('is oceon blue?', 'Yes', 'No', 1),
  Question('is oceon blue?', 'Yes', 'No', 1),
  Question('is oceon blue?', 'Yes', 'No', 1),
  Question('is oceon blue?', 'Yes', 'No', 1),
  Question('is oceon blue?', 'Yes', 'No', 1),
  Question('is oceon blue?', 'Yes', 'No', 1),
  Question('is oceon blue?', 'Yes', 'No', 1),
  Question('is oceon blue?', 'Yes', 'No', 1),
  Question('is oceon blue?', 'Yes', 'No', 1),
];
