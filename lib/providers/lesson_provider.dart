import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/lesson.dart';
import '../models/stream.dart' as model;
import 'stream_provider.dart';

class lessonProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<lesson> _items = [];
  // get lessons
  List<lesson> get items {
    return [...items];
  }

//add lesson
  void addLesson(newLesson) {
    _items.add(newLesson);
    notifyListeners();
  }

//collection
  final CollectionReference lessonCollection =
      FirebaseFirestore.instance.collection('lessons');

// adding lesson into lessons collection

  uploadLesson(lesson Lesson) async {
    String res = "";
    try {
      DocumentReference newDocRef = await lessonCollection.add({
        'title': Lesson.title,
        'grade': Lesson.grade,
        'authorId': Lesson.authorId,
        'courseId': Lesson.courseId,
        'content': Lesson.content,
      });
      res = "Lesson uploaded Succesfully!";

      // then registor on Streams collection
      DateTime currentDate = DateTime.now();
      Timestamp firestoreTimestamp = Timestamp.fromDate(currentDate);
      String streamId = const Uuid().v1();
      model.Stream newStream = model.Stream(
        authorId: Lesson.authorId,
        streamId: streamId,
        collection: "lessons",
        courseId: Lesson.courseId,
        docId: newDocRef.id,
        date: firestoreTimestamp,
      );
      _firestore.collection("streams").doc(streamId).set(newStream.toJson());
      streamProvider().addStream(newStream);
      addLesson(Lesson);
    } catch (err) {
     
      res = err.toString();
    }
    return res;
  }
// get lesson by docId
   Future<lesson> getCourseLessonByDocId(String docId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('lessons')
          .doc(docId)
          .get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return lesson(          
          title: data['title'],
          grade: data['grade'],
          authorId: data['authorId'],
          courseId: data['courseId'],
          content: data['content'],
        );
      } else {
        throw Exception("Document not found");
      }
    } catch (error) {
      throw error.toString();
    }
  }
}
