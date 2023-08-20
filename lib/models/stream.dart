import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Stream {
  final String streamId;
  final String collection;
  final String courseId;
  final String docId;
  final Timestamp date;
  Stream({
    required this.streamId,
    required this.collection,
    required this.courseId,
    required this.docId,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'streamId': streamId,
      'collection': collection,
      'courseId': courseId,
      'docId': docId,
      'date': date,
    };
  }

  Map<String, dynamic> toJson() => {
        'streamId': streamId,
        'collection': collection,
        'courseId': courseId,
        'docId': docId,
        'date': date,
      };
}
