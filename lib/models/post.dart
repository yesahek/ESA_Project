// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postId;
  final String? description;
  final String? imageUrl;
  final int likes;
  final String uid;
  final String username;
  final Timestamp datePublished;
  final List? question;
  final List? choices;
  final int? answer;
  //late Question? question;
  Post({
    required this.postId,
    this.description,
    this.imageUrl,
    required this.likes,
    required this.uid,
    required this.username,
    required this.datePublished,
    this.question,
    this.choices,
    this.answer,
  });
  Map<String, dynamic> toJson() => {
        'id': postId,
        'description': description,
        'imageUrl': imageUrl,
        'likes': likes,
        'uid': uid,
        'username': username,
        'datePublished': datePublished,
        'question': question,
        'choices': choices,
        'answer': answer,
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'description': description,
      'imageUrl': imageUrl,
      'likes': likes,
      'uid': uid,
      'username': username,
      'datePublished': datePublished,
      'question': question,
      'choices': choices,
      'answer': answer,
    };
  }

  // String toJson() => json.encode(toMap());

  // factory Post.fromJson(String source) =>
  //     Post.fromMap(json.decode(source) as Map<String, dynamic>);
  // static Post fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return Post(
  //     uid: snapshot['uid'],
  //     postId: snapshot['postId'],
  //     username: snapshot['username'],
  //     datePublished: snapshot['datePublished'],
  //     likes: snapshot['likes'],
  //     answer: snapshot['answer'] ?? [],
  //     choices: snapshot['choices'] ?? [],
  //     description: snapshot['description'] ?? [],
  //     imageUrl: snapshot['imageUrl'],
  //     question: snapshot['question'] ?? [],
  //   );
  // }
}
