import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:flutter/material.dart';

class StudMaterial {
  final String id;
  final String title;
  final int grade;
  final String authorId;
  final DateTime date;
  final String dept;
  final String fileType;
  final String fileUrl;
  StudMaterial({
    required this.id,
    required this.title,
    required this.grade,
    required this.authorId,
    required this.date,
    required this.dept,
    required this.fileType,
    required this.fileUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'grade': grade,
      'authorId': authorId,
      'date': date.millisecondsSinceEpoch,
      'dept': dept,
      'fileType': fileType,
      'fileUrl': fileUrl,
    };
  }

  factory StudMaterial.fromMap(Map<String, dynamic> map) {
    return StudMaterial(
      id: map['id'] as String,
      title: map['title'] as String,
      grade: map['grade'] as int,
      authorId: map['authorId'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      dept: map['dept'] as String,
      fileType: map['fileType'] as String,
      fileUrl: map['fileUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'grade': grade,
        'authorId': authorId,
        'date': date.millisecondsSinceEpoch,
        'dept': dept,
        'fileType': fileType,
        'fileUrl':fileUrl,
      };

  factory StudMaterial.fromJson(String source) =>
      StudMaterial.fromMap(json.decode(source) as Map<String, dynamic>);

}
