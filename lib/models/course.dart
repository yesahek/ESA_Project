import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Course {
  final String courseId;
  final String title;
  final int grade;
  final String school;
  //final instractor;
  Course({
    required this.courseId,
    required this.title,
    required this.grade,
    required this.school,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'title': title,
      'grade': grade,
      'school': school,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseId: map['courseId'] as String,
      title: map['title'] as String,
      grade: map['grade'] as int,
      school: map['school'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'courseId': courseId,
        'title': title,
        'grade': grade,
        'school': school,
      };

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  where(bool Function(dynamic course) param0) {}
}
