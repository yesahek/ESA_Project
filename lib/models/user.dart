import 'dart:convert';

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
  final String password;

  final List<String> subjectes;
  final List followers;
  final List following;
  final String grade;
  final String school;
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
    required this.password,
    required this.subjectes,
    required this.followers,
    required this.following,
    required this.grade,
    required this.school,
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
      'password': password,
      'subjectes': subjectes,
      'followers': followers,
      'following': following,
      'grade': grade,
      'school': school,
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
      password: map['password'] as String,
      subjectes: List<String>.from(map['subjectes'] as List<String>),
      followers: List.from(map['followers'] as List),
      following: List.from(map['following'] as List),
      grade: map['grade'] as String,
      school: map['school'] as String,
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
        'subjects': subjectes,
        'grade': grade,
        'school': school,
      };

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
