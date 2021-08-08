class Question {
  String question;
  String answer1;
  String answer2;

  // right answer 1-> answer1, 2-> answer2
  int trueAnswer;

  // constructor
  Question(this.question, this.answer1, this.answer2, this.trueAnswer);

  bool isRight(int num) {
    if (num == 1 || num == 2) {
      // pass
    }
    else {
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

List<Question> testList = [
  Question('Is ocean blue?', 'Yes', 'No', 1),
  Question('What year second world war started ?', '1940', '1939', 2),
  Question('What year second world war finished ?', '1945', '1944', 1),
  Question('What is the name of the best movie ranked by IMDB ?',
      'The Godfather', 'The Shawshank Redemption', 2),
  Question(
      'For what movie did Tom Hanks score his first Academy Award nomination?',
      'Sleepless in Seatle',
      'Big',
      2),
  Question(
      'What American writer/director starred in several iconic European-produced “Spaghetti Westerns“?',
      'Clint Eastwood',
      'Henry Fonda',
      1),
  Question('What Hollywood movie star plays himself in Zombieland?',
      'Bill Murray', 'Emma Stone', 1),
  Question('What is the highest-grossing R-rated movie of all time?', 'Joker',
      'Pulp Fiction', 1),
  Question(
      'Which movie was incorrectly announced as the winner of Best Picture at the 2017 Academy Awards, during the greatest Oscars flub of all time?',
      'La La Land',
      'Rope',
      1),
  Question(
      'The stage play Everybody Comes to Rick’s was adapted for the screen to become what 1942 Best Picture winner?',
      'La La Land',
      'Casablanca',
      2),
];
