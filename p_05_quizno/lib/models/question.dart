class Question {
  String _question;
  String _answer1;
  String _answer2;

  // right answer 1-> answer1, 2-> answer2
  int _trueAnswer;

  // constructor
  Question(this._question, this._answer1, this._answer2, this._trueAnswer);

  String get answer1 {
    return _answer1;
  }

  String get answer2 {
    return _answer2;
  }

  String get question => _question;


  set question(String value) {
    _question = value;
  }

  set answer1(String value) {
    _answer1 = value;
  }

  set answer2(String value) {
    _answer2 = value;
  }

  set trueAnswer(int value) {
    _trueAnswer = value;
  }

  bool isRight(int num) {
    if (num == 1 || num == 2) {
      // pass
    }
    else {
      return false;
    }
    // true answer -> 1
    if (_trueAnswer == 1) {
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
