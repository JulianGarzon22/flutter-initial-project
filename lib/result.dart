import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;

    if (this.resultScore >= 20) {
      resultText = 'I like you too much!';
    } else if (this.resultScore < 20 && this.resultScore >= 10) {
      resultText = 'I like a little bit';
    } else {
      resultText = 'You sucks for me :(';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            textColor: Colors.blue,
            child: Text('Restart quiz'),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
