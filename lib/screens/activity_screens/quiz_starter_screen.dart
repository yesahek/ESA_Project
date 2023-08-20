// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:flutter/material.dart';

import '../../models/quiz.dart' as model;
import '../../widget/answer.dart';
import '../../widget/question.dart';

class QuizStarter extends StatefulWidget {
  final model.Quiz quiz;
  QuizStarter({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  State<QuizStarter> createState() => _QuizStarterState();
}

class _QuizStarterState extends State<QuizStarter> {
  bool _isStarting = true;

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuize() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // print(_questionIndex);
  }

  void _start() {
    setState(() {
      _isStarting = false;
    });
  }

  String get resultPhrase {
    // ignore: prefer_typing_uninitialized_variables
    var resultText;
    if (_totalScore <= 8) {
      resultText = 'You are awesome and innconjent!';
    } else if (_totalScore <= 12) {
      resultText = 'Pretty Likable';
    } else if (_totalScore <= 20) {
      resultText = 'You are Steranger?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  String get scorePhrase {
    var scoreText = 'Score: $_totalScore ';
    return scoreText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: widget.quiz.questions.length > _questionIndex
                ? _isStarting
                    ? Column(
                        children: [
                          MyAppBar(
                              backArrow: true,
                              title: "Quiz HomePage",
                              name: ''),
                          Center(
                            child: Text(
                              "Starting...",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              "Consectetur aliqua minim enim excepteur dolore commodo veniam. Culpa labore occaecat officia occaecat irure labore. Qui culpa incididunt esse sint nisi aute. Officia aliquip et reprehenderit ipsum ea ad voluptate consectetur duis amet dolore. Quis in eu amet adipisicing ea nulla sunt et reprehenderit ullamco. Ullamco qui nisi nulla irure aliqua sint dolore culpa."),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: _start,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.blue),
                              child: Center(
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          MyAppBar(
                              backArrow: true, title: "questions", name: ''),
                          Question(
                            widget.quiz.questions[_questionIndex].questionText,
                          ),
                          ...widget.quiz.questions[_questionIndex].answers
                              .map((answer) {
                            return Answer(() => _answerQuestion(answer.score),
                                answer.text);
                          }).toList()
                        ],
                      )
                : Column(
                    children: [
                      MyAppBar(backArrow: true, title: "Quiz End!", name: ''),
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
                          'Back To Quiz Main page!',
                        ),
                        //textColor: Colors.blue,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
