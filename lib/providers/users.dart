import 'package:flutter/material.dart';
import '../models/user.dart';
import '../resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  // User? _user;
  User _user = User(
    uid: '',
    username: '',
    firstname: '',
    lastname: '',
    surnname: '',
    type: '',
    sex: '',
    sId: '',
    photoUrl: '',
    email: '',
    subjectes: [],
    followers: [],
    following: [],
    grade: 0,
    school: '',
    status: false,
    state: '',
  );

  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
