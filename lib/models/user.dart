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

  final List followers;
  final List following;
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
    required this.followers,
    required this.following,
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
      'followers': followers,
      'following': following,
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
      followers: List.from(map['followers'] as List),
      following: List.from(map['following'] as List),
      password: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
