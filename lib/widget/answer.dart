import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHundler;
  var answerText;

  Answer(this.selectHundler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerText,style: const TextStyle(color: Colors.white),),
        onPressed: selectHundler,
        
        // color: Colors.blue,
        // textColor: Colors.white,
      ),
    );
  }
}
