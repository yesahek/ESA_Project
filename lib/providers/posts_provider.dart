import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sup_app/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class PostProvider with ChangeNotifier {
  // List<Post> _items = [
  //   Post(
  //     postId: "p01",
  //     description: "This is Awesome",
  //     uid: "u1",
  //     username: "mihret",
  //     datePublished: Timestamp.fromDate(DateTime(2017, 9, 7)),
  //     imageUrl:
  //         "https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg",
  //     likes: 0,
  //     question: [
  //       "q01",
  //       "What is this ",
  //     ],
  //     answer: 2,
  //     choices: [
  //       "Cat",
  //       "Dog",
  //       "Rat",
  //     ],
      // question: Question(
      //   questionId: "q01",
      //   question: "What is this ",
      //   choice: [
      //     "Cat",
      //     "Dog",
      //     "Rat",
      //   ],
      //answer: 2,
      // )
  //  ),
    // Post(
    //     postId: "p01",
    //     description: "This is Awesome",
    //     uid: "u1",
    //     username: "isaac",
    //     datePublished: DateTime(2017, 9, 7),
    //     likes: 0,
    //     question: Question(
    //       questionId: 'q02',
    //       question: "location",
    //       choice: ["Addis Ababa", "Ethiopia", "Africa"],
    //     )),
    // Post(
    //   postId: "p01",
    //   description: "This is Awesome",
    //   uid: "u1",
    //   username: "chala",
    //   datePublished: DateTime(2017, 9, 7),
    //   imageUrl:
    //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJngcaGXB4w_Y_r1xyYX23oNp5_ZUc_REfYQ&usqp=CAU",
    //   likes: 0,
    // ),
  //];

   List<Post> _items = [];

// post get
  List<Post> get item {
    return [..._items];
  }

  // void addPost(newPost) {
  //   _items.add(newPost);
  // }

  int? checkAnswer(ind) {
    return _items.firstWhere(ind).answer;
    // return _items.firstWhere(ind).question?.answer;
  }

//upload post to database
  Future<String> AddPost({
    required String uid,
    String? description,
    Uint8List? file,
    required String firstName,
    String? question,
    String? choiceA,
    String? choiceB,
    String? choiceC,
    String? choiceD,
    int? answer,
  }) async {
    String res = "Some error occurred";
    try {
      if (uid.isNotEmpty ||
          description != '' ||
          file != null ||
          question != "") {
        String imageUrl = '';
        // if the post does have an image check and uploading image
        if (file != null)
          imageUrl =
              await StorageMethods().uploadImageToStorage("Posts", file, true);
        DateTime currentDate = DateTime.now();
        String postId = const Uuid().v1();
        String questionId = const Uuid().v1();
        Timestamp firestoreTimestamp = Timestamp.fromDate(currentDate);
        //print(imageUrl);
        Post post = Post(
          datePublished: firestoreTimestamp,
          likes: 0,
          postId: postId,
          uid: uid,
          username: firstName,
          description: description!,
          imageUrl: imageUrl,
          question: [
            questionId,
            question,
          ],
          choices: [choiceA, choiceB, choiceC, choiceD],
          answer: answer,
          // Question(
          //     questionId: questionId,
          //     question: question!,
          //     choice: [choiceA, choiceB, choiceC, choiceD],
          //     answer: answer),
        );
        await _firestore.collection("posts").doc(postId).set(
              post.toJson(),
            );
        res = "success";
        notifyListeners();
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // FetchPosts from firbase and notifying notifyers
  Future<void> fetchPosts() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('posts').get();
      _items = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        print(_items.length);
        return Post(
          uid: data['uid']!,
          postId: data['id']!,
          username: data['username']!,
          datePublished: data['datePublished'] as Timestamp,
          likes: data['likes']!,
          answer: data['answer'] as int?,
          choices: List<String>.from(data['choices'] ?? []),
          description: data['description']!,
          imageUrl: data['imageUrl']!,
          question: List<String>.from(data['question'] ?? []),
        );
      }).toList();
      notifyListeners();
    } catch (e) {
      // Handle any errors that occur during fetching.
      print('Error fetching posts: posts_provider class $e');
    }
    notifyListeners();
  }
}
