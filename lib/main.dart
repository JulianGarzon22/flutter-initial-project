import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite soccer team?',
      'answers': ['Barcelona', 'Real Madrid', 'PSG', 'Chelsea'],
    },
    {
      'questionText': 'How many siblings do you have?',
      'answers': ['1', '2', '3', '4'],
    },
    {
      'questionText': 'What\'s your favorite city',
      'answers': ['Montreal', 'Bogotá', 'Madrid', 'Londres'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('My Flutter App'),
          ),
          body: _questionIndex < questions.length ? Column(
            children: <Widget>[
              Question(questions[_questionIndex]['questionText']),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList(),
            ],
          ) : Center(
            child: Text('You have finished'),
          ),
        ));
  }
}
