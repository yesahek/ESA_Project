import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String uid;
  final String username;
  final String firstname;
  final String lastname;
  final String surnname;
  final String type;
  final String sex;
  final String sId;
  final String photoUrl;
  final String email;
  final List subjects;
  final List followers;
  final List following;
  final int grade;
  final String school;
  final bool status;
  final String state;
  final String phone;
  User({
    required this.uid,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.surnname,
    required this.type,
    required this.sex,
    required this.sId,
    required this.photoUrl,
    required this.email,
    required this.subjects,
    required this.followers,
    required this.following,
    required this.grade,
    required this.school,
    required this.status,
    required this.state,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'surnname': surnname,
      'type': type,
      'sex': sex,
      'sId': sId,
      'photoUrl': photoUrl,
      'email': email,
      'subjects': subjects,
      'followers': followers,
      'following': following,
      'grade': grade,
      'school': school,
      'status': status,
      'state': state,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      username: map['username'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      surnname: map['surnname'] as String,
      type: map['type'] as String,
      sex: map['sex'] as String,
      sId: map['sId'] as String,
      photoUrl: map['photoUrl'] as String,
      email: map['email'] as String,
      subjects: List<String>.from(map['subjects'] as List<String>),
      followers: List.from(map['followers'] as List),
      following: List.from(map['following'] as List),
      grade: map['grade'] as int,
      school: map['school'] as String,
      status: map['status'] as bool,
      state: map['state'] as String,
      phone: map['phone'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'firstname': firstname,
        'lastname': lastname,
        'surnname': surnname,
        'type': type,
        'sex': sex,
        'sId': sId,
        'photoUrl': photoUrl,
        'email': email,
        'followers': followers,
        'following': following,
        'subjects': subjects,
        'grade': grade,
        'school': school,
        'status': status,
        'state': state,
        'phone': phone,
      };

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      uid: snapshot['uid'],
      username: snapshot['username'],
      firstname: snapshot['firstname'],
      lastname: snapshot['lastname'],
      surnname: snapshot['surnname'],
      type: snapshot['type'],
      sex: snapshot['sex'],
      sId: snapshot['sId'],
      photoUrl: snapshot['photoUrl'],
      email: snapshot['email'],
      subjects: snapshot['subjects'] ?? [],
      followers: snapshot['followers'] ?? [],
      following: snapshot['following'] ?? [],
      grade: snapshot['grade'],
      school: snapshot['school'],
      status: snapshot['status'],
      state: snapshot['state'],
      phone: snapshot['phone'],
    );
  }
}
