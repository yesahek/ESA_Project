

import 'dart:convert';

class courseMaterial {
  final String id;
  final String title;
  final int grade;
  final String authorId;
  final DateTime date;
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
      'date': date.millisecondsSinceEpoch,
      'courseId': courseId,
      'fileType': fileType,
      'fileUrl': fileUrl,
    };
  }

  factory courseMaterial.fromMap(Map<String, dynamic> map) {
    return courseMaterial(
      id: map['id'] as String,
      title: map['title'] as String,
      grade: map['grade'] as int,
      authorId: map['authorId'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      fileType: map['fileType'] as String,
      fileUrl: map['fileUrl'] as String, 
      courseId: map[''] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'grade': grade,
        'authorId': authorId,
        'date': date.millisecondsSinceEpoch,
        'courseId': courseId,
        'fileType': fileType,
        'fileUrl': fileUrl,
      };

  factory courseMaterial.fromJson(String source) =>
      courseMaterial.fromMap(json.decode(source) as Map<String, dynamic>);

}
