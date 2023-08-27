import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sup_app/providers/stream_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/stream.dart' as model;
import '../models/quiz.dart';

class QuizProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Quiz> _quizzes = [
    Quiz(
      title: 'English Quiz',
      questions: [
        Question(
          questionText: 'What is your favorite color?',
          answers: [
            Answer(text: 'Black', score: 10),
            Answer(text: 'Red', score: 0),
            Answer(text: 'Green', score: 0),
            Answer(text: 'White', score: 0),
          ],
        ),
        Question(
          questionText: 'What is your favorite animal?',
          answers: [
            Answer(text: "Rabbit", score: 0),
            Answer(text: "Snake", score: 0),
            Answer(text: "Elephant", score: 0),
            Answer(text: "Lion", score: 10),
          ],
        ),
        Question(
          questionText: "What is your favorite Tv Show?",
          answers: [
            Answer(text: "Seifu On EBS", score: 10),
            Answer(text: "120", score: 0),
            Answer(text: "#Time", score: 0),
            Answer(text: "kana", score: 0),
          ],
        )
      ],
    ),

//Quiz 2 Maths

    Quiz(
      title: 'Maths Quiz',
      questions: [
        Question(
          questionText: 'What is your favorite color?',
          answers: [
            Answer(text: 'Black', score: 10),
            Answer(text: 'Red', score: 5),
            Answer(text: 'Green', score: 3),
            Answer(text: 'White', score: 1),
          ],
        ),
        Question(
          questionText: 'What is your favorite animal?',
          answers: [
            Answer(text: "Rabbit", score: 3),
            Answer(text: "Snake", score: 7),
            Answer(text: "Elephant", score: 5),
            Answer(text: "Lion", score: 10),
          ],
        ),
        Question(
          questionText: "What is your favorite Tv Show?",
          answers: [
            Answer(text: "Seifu On EBS", score: 10),
            Answer(text: "120", score: 5),
            Answer(text: "#Time", score: 2),
            Answer(text: "kana", score: 1),
          ],
        )
      ],
    ),

    // more quizzes
  ];

  List<Quiz> get quizzes => [..._quizzes];

Future<Quiz> getQuizByDocId(String quizId) async {
  try {
    DocumentSnapshot quizSnapshot = await quizzesCollection.doc(quizId).get();
    if (quizSnapshot.exists) {
      Map<String, dynamic> quizData = quizSnapshot.data() as Map<String, dynamic>;
      List<Map<String, dynamic>> questionDataList = List<Map<String, dynamic>>.from(quizData['questions']);
      
      List<Question> questions = questionDataList.map((questionData) {
        List<Map<String, dynamic>> answerDataList = List<Map<String, dynamic>>.from(questionData['answers']);
        List<Answer> answers = answerDataList.map((answerData) {
          return Answer(text: answerData['text'], score: answerData['score']);
        }).toList();
        
        return Question(
          questionText: questionData['questionText'],
          answers: answers,
        );
      }).toList();
      
      Quiz quiz = Quiz(title: quizData['title'], questions: questions);
      return quiz;
    } else {
      throw Exception("Quiz with ID $quizId not found");
    }
  } catch (error) {
    print("Error fetching quiz: $error");
    rethrow;
  }
}


  final CollectionReference quizzesCollection =
      FirebaseFirestore.instance.collection('quizzes');
  addQuiz(String uid ,String courseId, Quiz quiz) async {
    String res = "";
    try {
      DocumentReference newDocRef = await quizzesCollection.add({
        'title': quiz.title,
        'questions': quiz.questions.map((question) {
          return {
            'questionText': question.questionText,
            'answers': question.answers.map((answer) {
              return {
                'text': answer.text,
                'score': answer.score,
              };
            }).toList(),
          };
        }).toList(),
      });

      // register on streams db
      DateTime currentDate = DateTime.now();
      Timestamp firestoreTimestamp = Timestamp.fromDate(currentDate);
      String streamId = const Uuid().v1();
      model.Stream newStream = model.Stream(
        authorId: uid,
          streamId: streamId,
          collection: "quizzes",
          courseId: courseId,
          docId: newDocRef.id,
          date: firestoreTimestamp,
          );
      _firestore.collection("streams").doc(streamId).set(newStream.toJson());
      streamProvider().addStream(newStream);

      res = "Quiz uploaded successfully!";
    } catch (err) {
      print("quiz provider ${err.toString()}");
      res = err.toString();
    }
    return res;
  }
}
