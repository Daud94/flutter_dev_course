import 'package:flutter/cupertino.dart';
import 'package:quizzler_flutter/question.dart';

class QuizBrain{
  // list to keep track of answered questions
  List<Widget> scoreKeeper = [];

  // list of questions
  List<Question> questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true)
  ];

  int questionNo = 0;
}