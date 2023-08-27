import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class lesson {
  final String title;
  final int grade;
  final String authorId;
  final String courseId;
  final String content;
  lesson({
    required this.title,
    required this.grade,
    required this.authorId,
    required this.courseId,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'grade': grade,
      'authorId': authorId,
      'courseId': courseId,
      'content': content,
    };
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'grade': grade,
        'authoriD': authorId,
        'courseId': courseId,
        'content': content,
      };
}
