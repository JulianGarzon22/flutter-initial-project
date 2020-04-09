import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite soccer team?',
      'answers': [
        {'text': 'Barcelona', 'score': 10},
        {'text': 'Real Madrid', 'score': 5},
        {'text': 'PSG', 'score': 2},
        {'text': 'Chelsea', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite planet',
      'answers': [
        {'text': 'Mars', 'score': 10},
        {'text': 'Jupiter', 'score': 5},
        {'text': 'Saturn', 'score': 2},
        {'text': 'Earth', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite city',
      'answers': [
        {'text': 'Montreal', 'score': 10},
        {'text': 'Bogotá', 'score': 5},
        {'text': 'Madrid', 'score': 2},
        {'text': 'Londres', 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
    });
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('My Flutter App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(questionIndex: _questionIndex,
              questions: _questions,
              answerQuestion: _answerQuestion)
              : Result(_totalScore, resetQuiz),
        ));
  }
}
