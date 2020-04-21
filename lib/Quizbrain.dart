import 'Question.dart';

class Quizbrain {
  int _Question_number = 0;
  List<Question> _questionbank = [
    Question(s: 'Your age is 21', a: true),
    Question(s: 'Your name is Naman', a: true),
    Question(s: 'You are a cs major', a: true)
  ];

  void nextQuestion() {
    if (_Question_number < _questionbank.length - 1) {
      _Question_number++;
    }
  }

  String Getquestiontext() {
    return _questionbank[_Question_number].questiontext;
  }

  bool Getquestionanswer() {
    return _questionbank[_Question_number].answertext;
  }
}
