import 'package:e_sup_app/models/question.dart';

class Post {
  final String postId;
  final String description;
  final String imageUrl;
  final likes;
  final String uid;
  final String username;
  final DateTime datePublished;
  late Question? question;
  Post({
    required this.postId,
    this.description = '',
    this.imageUrl = '',
    required this.likes,
    required this.uid,
    required this.username,
    required this.datePublished,
    this.question = null,
  });
 Map<String, dynamic> toJson() => {
        'id': postId,
        'description':description,
        'imageUrl':imageUrl,
        'likes':likes,
        'uid':uid,
        'username': username ,
        'datePublished': datePublished,
        'question' : question,

      };
}

