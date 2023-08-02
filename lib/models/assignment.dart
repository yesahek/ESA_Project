// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class Assignment {
  final String assignmentId;
  final String educatorId;
  final String assignmentTitle;
  final String courseId;
  final Timestamp date;
  final Timestamp dueDate;
  final String fileType;
  final String fileUrl;
  final String description;
  Assignment({
    required this.assignmentId,
    required this.educatorId,
    required this.assignmentTitle,
    required this.courseId,
    required this.date,
    required this.dueDate,
    required this.fileType,
    required this.fileUrl,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'assignmentId': assignmentId,
      'assignmentTitle': assignmentTitle,
      'courseId': courseId,
      'date': date,
      'dueDate': dueDate,
      'fileType': fileType,
      'fileUrl': fileUrl,
      'description': description,
      'educatorId':educatorId,
    };
  }
factory Assignment.fromMap(Map<String, dynamic> map) {
    return Assignment(
      assignmentId: map['assignmentId'] as String,
      educatorId: map['educatorId'] as String,
      assignmentTitle: map['assignmentTitle'] as String,
      courseId: map['courseId'] as String,
      date: map['date'] as Timestamp,
      dueDate: map['dueDate'] as Timestamp,
      fileType: map['fileType'] as String,
      fileUrl: map['fileUrl'] as String,
      description: map['description'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        'assignmentId': assignmentId,
        'assignmentTitle': assignmentTitle,
        'educatorId': educatorId,
        'courseId': courseId,
        'date': date,
        'dueDate': dueDate,
        'fileType': fileType,
        'fileUrl': fileUrl,
        'description': description,
      };
}
