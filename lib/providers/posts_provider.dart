import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../models/post.dart';
import '../models/question.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sup_app/resources/storage_methods.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

import '../models/course_material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class PostProvider with ChangeNotifier {
  List<Post> _items = [
    Post(
        postId: "p01",
        description: "This is Awesome",
        uid: "u1",
        username: "mihret",
        datePublished: DateTime(2017, 9, 7),
        imageUrl:
            "https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg",
        likes: 0,
        question: Question(
          questionId: "q01",
          question: "What is this ",
          choice: [
            "Cat",
            "Dog",
            "Rat",
          ],
          answer: 2,
        )),

    Post(
        postId: "p01",
        description: "This is Awesome",
        uid: "u1",
        username: "isaac",
        datePublished: DateTime(2017, 9, 7),
        likes: 0,
        question: Question(
          questionId: 'q02',
          question: "location",
          choice: ["Addis Ababa", "Ethiopia", "Africa"],
        )),
    Post(
      postId: "p01",
      description: "This is Awesome",
      uid: "u1",
      username: "chala",
      datePublished: DateTime(2017, 9, 7),
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJngcaGXB4w_Y_r1xyYX23oNp5_ZUc_REfYQ&usqp=CAU",
      likes: 0,
    ),
  ];

 // List<Post> _items = [];

// post get
  List<Post> get item {
    return [..._items];
  }

//adding Forum
  // Future<String> postToForum(
  //   String description,
  //   String uid,
  //   String courseId,
  //   int grade,
  //   String courseName,
  //   Uint8List? file,
  //   String userName,
  //   //Question? question
  // ) async {
  //   // String? fileType = lookupMimeType(file.path);
  //   String res = "Some error occurred";

  //   try {
  //     String postId = const Uuid().v1();
  //     String FileUrl = await StorageMethods().uploadFileToStorage(
  //         "Forum", "{$courseName} Grade $grade", postId, file as File);
  //     DateTime currentDate = DateTime.now(); // Get the current date and time
  //     Timestamp firestoreTimestamp = Timestamp.fromDate(currentDate);
  //     // creates unique id based on time
  //     Post forumPost = Post(
  //       datePublished: firestoreTimestamp,
  //       likes: 0,
  //       postId: postId,
  //       uid: uid,
  //       username: userName,
  //       description: description,
  //       imageUrl: FileUrl.toString(),
  //       question: null,
  //     );
  //     _firestore.collection("Forum").doc(postId).set(forumPost.toJson());
  //     //courseMaterialProvider().addMaterial(CourseMaterial);

  //     res = "success";
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   notifyListeners();
  //   return res;
  // }

  void addPost(newPost) {
    _items.add(newPost);
  }

  int? checkAnswer(ind) {
    return _items.firstWhere(ind).question?.answer;
  }

  notifyListeners();
}
