import 'package:flutter/material.dart';

import '../models/post.dart';
import '../utils/colors.dart';

class Choice extends StatefulWidget {
  final Post item;
  final String choice;
  final int ind;
  const Choice(
      {super.key, required this.choice, required this.ind, required this.item});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  bool _answerd = false;
  String _Incorrect = "❌";
  String _correct = "✔";
  bool _isCorrect = false;
  _checkAnswer() {
    int? Answer = widget.item.question?.answer;
    bool result = Answer == widget.ind;

    setState(() {
      _answerd = !_answerd;
      _isCorrect = result;
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: blueColor,
      decoration: BoxDecoration(
        //color: blueColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () => _checkAnswer(),
        child: Container(
          height: 50,
          //width: 50,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(style: BorderStyle.solid)),
          child: Center(
            child: _answerd
                ? _isCorrect
                    ? Text(widget.choice + " $_correct")
                    : Text(widget.choice + " $_Incorrect")
                : Text(widget.choice),
          ),
        ),
      ),
    );
  }
}
