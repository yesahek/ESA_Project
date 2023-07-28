// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:cloud_firestore/cloud_firestore.dart';

class courseMaterial {
  final String id;
  final String title;
  final int grade;
  final String authorId;
  final Timestamp date;
  final String courseId;
  final String fileType;
  final String fileUrl;
  courseMaterial({
    required this.id,
    required this.title,
    required this.grade,
    required this.authorId,
    required this.date,
    required this.courseId,
    required this.fileType,
    required this.fileUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'grade': grade,
      'authorId': authorId,
      'date': date,
      'courseId': courseId,
      'fileType': fileType,
      'fileUrl': fileUrl,
    };
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'grade': grade,
        'authorId': authorId,
        'date': date,
        'courseId': courseId,
        'fileType': fileType,
        'fileUrl': fileUrl,
      };
}
