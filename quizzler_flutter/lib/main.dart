import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const Quizzler());
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
                      quiz.getQuestion(),
                      style: const TextStyle(
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
                      bool correctAnswer = quiz.getAnswer();
                      if (correctAnswer == true) {
                        quiz.scoreKeeper.add(const Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                      } else {
                        quiz.scoreKeeper.add(const Icon(
                          Icons.check,
                          color: Colors.red,
                        ));
                      }
                    });
                    quiz.nextQuestion();
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
                            quiz.getAnswer();
                        if (correctAnswer == false) {
                          quiz.scoreKeeper.add(const Icon(
                            Icons.check,
                            color: Colors.green,
                          ));
                        } else {
                          quiz.scoreKeeper.add(const Icon(
                            Icons.check,
                            color: Colors.red,
                          ));
                        }
                      });
                      quiz.nextQuestion();
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


