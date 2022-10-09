import 'package:flutter/material.dart';
import 'package:quizzler_flutter/question.dart';
import 'package:quizzler_flutter/quiiz_brain.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
 QuizBrain quiz = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      quiz.questions[quiz.questionNo].questionText,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              // True Button
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      bool correctAnswer = quiz.questions[quiz.questionNo].questionAnswer;
                      if (correctAnswer == true) {
                        quiz.scoreKeeper.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                      } else {
                        quiz.scoreKeeper.add(Icon(
                          Icons.check,
                          color: Colors.red,
                        ));
                      }
                    });
                    quiz.questionNo++;
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.green),
                  ),
                  child: const Text(
                    'True',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
              // False button
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        bool correctAnswer =
                            quiz.questions[quiz.questionNo].questionAnswer;
                        if (correctAnswer == false) {
                          quiz.scoreKeeper.add(Icon(
                            Icons.check,
                            color: Colors.green,
                          ));
                        } else {
                          quiz.scoreKeeper.add(Icon(
                            Icons.check,
                            color: Colors.red,
                          ));
                        }
                      });
                      quiz.questionNo++;
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'False',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )),
              )),
              Row(
                children: quiz.scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
question1: , false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
