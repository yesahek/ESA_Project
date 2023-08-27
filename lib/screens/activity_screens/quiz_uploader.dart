// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sup_app/models/course.dart';
import 'package:e_sup_app/providers/courses_provider.dart';
import 'package:e_sup_app/providers/quiz_provider.dart';
import 'package:e_sup_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/quiz.dart';

// ignore: must_be_immutable
class QuizUploader extends StatefulWidget {
  String uid;
  String courseId;
  QuizUploader(
    this.uid,
    this.courseId,
  );

  @override
  _QuizUploaderState createState() => _QuizUploaderState();
}

class _QuizUploaderState extends State<QuizUploader> {
  late List<Course> course;

  @override
  void initState() {
    super.initState();
    setCourseDetail();
    titleController.text = course[0].title;
  }

  // final CollectionReference quizzesCollection =
  //     FirebaseFirestore.instance.collection('quizzes');

  final TextEditingController titleController = TextEditingController();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerAController = TextEditingController();
  final TextEditingController scoreAController = TextEditingController();
  final TextEditingController answerBController = TextEditingController();
  final TextEditingController scoreBController = TextEditingController();
  final TextEditingController answerCController = TextEditingController();
  final TextEditingController scoreCController = TextEditingController();
  final TextEditingController answerDController = TextEditingController();
  final TextEditingController scoreDController = TextEditingController();

  List<Question> questions = [];

  void _addQuestion() {
    String questionText = questionController.text;
    // print(questionText);
    List<Answer> answers = [];

    if (answerAController.text.isNotEmpty &&
        scoreAController.text.isNotEmpty &&
        answerBController.text.isNotEmpty &&
        scoreBController.text.isNotEmpty &&
        answerCController.text.isNotEmpty &&
        scoreCController.text.isNotEmpty &&
        answerDController.text.isNotEmpty &&
        scoreDController.text.isNotEmpty) {
      answers.add(
        Answer(
          text: answerAController.text,
          score: int.parse(scoreAController.text),
        ),
      );
      answers.add(
        Answer(
          text: answerBController.text,
          score: int.parse(scoreBController.text),
        ),
      );
      answers.add(
        Answer(
          text: answerCController.text,
          score: int.parse(scoreCController.text),
        ),
      );
      answers.add(
        Answer(
          text: answerDController.text,
          score: int.parse(scoreDController.text),
        ),
      );
    }

    questions.add(Question(questionText: questionText, answers: answers));

    questionController.clear();
    answerAController.clear();
    scoreAController.clear();
    answerBController.clear();
    scoreBController.clear();
    answerCController.clear();
    scoreCController.clear();
    answerDController.clear();
    scoreDController.clear();

    setState(() {});
  }

  _selectQuestion(Question question) {
    if (answerAController.text.isNotEmpty &&
        scoreAController.text.isNotEmpty &&
        answerBController.text.isNotEmpty &&
        scoreBController.text.isNotEmpty &&
        answerCController.text.isNotEmpty &&
        scoreCController.text.isNotEmpty &&
        answerDController.text.isNotEmpty &&
        scoreDController.text.isNotEmpty) {
      _addQuestion();
    }
    setState(() {
      questionController.text = question.questionText;
      answerAController.text = question.answers[0].text;
      scoreAController.text = question.answers[0].score.toString();
      answerBController.text = question.answers[1].text;
      scoreBController.text = question.answers[1].score.toString();
      answerCController.text = question.answers[2].text;
      scoreCController.text = question.answers[2].score.toString();
      answerDController.text = question.answers[3].text;
      scoreDController.text = question.answers[3].score.toString();
      questions.remove(question);
    });
  }

  _uploadQuiz() async {
    String res = '';
    if (questions.isNotEmpty) {
      try {
        Quiz quiz = Quiz(title: titleController.text, questions: questions);
        res = await QuizProvider().addQuiz(widget.uid,widget.courseId, quiz);
      } catch (e) {
        print(e.toString());
        res = e.toString();
      }
      showSnackBar(context, res);
      Navigator.of(context).pop();
    }
  }

  void setCourseDetail() {
    course = Provider.of<CoursesProvider>(context, listen: false)
        .findByCourseId(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration:
                  InputDecoration(labelText: course[0].title, enabled: false),
            ),
            SizedBox(height: 16),
            TextField(
              controller: questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: answerAController,
                    decoration: InputDecoration(labelText: 'Answer'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: scoreAController,
                    decoration: InputDecoration(labelText: 'Score'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: answerBController,
                    decoration: InputDecoration(labelText: 'Answer'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: scoreBController,
                    decoration: InputDecoration(labelText: 'Score'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: answerCController,
                    decoration: InputDecoration(labelText: 'Answer'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: scoreCController,
                    decoration: InputDecoration(labelText: 'Score'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: answerDController,
                    decoration: InputDecoration(labelText: 'Answer'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: scoreDController,
                    decoration: InputDecoration(
                      labelText: 'Score',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                  onPressed: _addQuestion,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  Question question = questions[index];
                  return GestureDetector(
                    onTap: () => _selectQuestion(question),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(question.questionText),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: question.answers.map((answer) {
                            return Text('${answer.text}: ${answer.score}');
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadQuiz,
              child: Text('Upload Quiz'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    questionController.dispose();
    answerAController.dispose();
    scoreAController.dispose();
    answerBController.dispose();
    scoreBController.dispose();
    answerCController.dispose();
    scoreCController.dispose();
    answerDController.dispose();
    scoreDController.dispose();
    super.dispose();
  }
}
