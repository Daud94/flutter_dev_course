import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler_flutter/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNo = 0;

  // list to keep track of answered questions
  List<Widget> scoreKeeper = [];

  // list of questions
  List<Question> _questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true)
  ];

  void nextQuestion() {
    if (_questionNo < _questions.length - 1) _questionNo++;
  }

  String getQuestion() {
    return _questions[_questionNo].questionText;
  }

  bool getAnswer() {
    return _questions[_questionNo].questionAnswer;
  }

}
