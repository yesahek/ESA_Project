import 'package:flutter/material.dart';

import '../models/post.dart';
import '../models/question.dart';

class Posts with ChangeNotifier {
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

// post get
  List<Post> get item {
    return [..._items];
  }

  void addPost(newPost) {
    _items.add(newPost);
  }

  int? checkAnswer(ind) {
    return _items.firstWhere(ind).question?.answer;
  }

  notifyListeners();
}
