import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int resultScore;
  VoidCallback resetQuize;

  Result(this.resultScore, this.resetQuize);

  String get resultPhrase {
    // ignore: prefer_typing_uninitialized_variables
    var resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innconjent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty Likable';
    } else if (resultScore <= 20) {
      resultText = 'You are Starnge?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  String get scorePhrase {
    var scoreText = 'Score: $resultScore ';
    return scoreText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          scorePhrase,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          child: const Text(
            'Restart Quiz!',
          ),
         //textColor: Colors.blue,
          onPressed: resetQuize,
        ),
      ],
    );
  }
}
