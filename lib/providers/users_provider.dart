import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart' as model;

class UserProvider with ChangeNotifier {
  // User? _user;
  model.User _user = model.User(
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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  model.User get getUser => _user;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  Future<void> refreshUser() async {
    model.User user = await getUserDetails();
    _user = user;
    notifyListeners();
  }

  //sign up user
  Future<String> signUpUser({
    String? username,
    required String firstname,
    required String lastname,
    String? surnname,
    required String type,
    required String sex,
    String? sId,
    String? photoUrl,
    required String email,
    required String password,
    required int grade,
    required String school,
    List<String>? subjects,
  }) async {
    String res = "Some error occurred";
    // checking 
    try {
      if (email.isNotEmpty ||
          firstname.isNotEmpty ||
          lastname.isNotEmpty ||
          grade.isNaN ||
          type.isNotEmpty ||
          sex.isNotEmpty ||
          password.isNotEmpty ||
          school.isNotEmpty) {
            //signuping on FirebaseAuth and store the user Credential on cred
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // print(cred.user!);
        //default profile picture link
        String profilePicUrl = "gs://esa-project-99df9.appspot.com/playground/default.jpg";
// storing information on firestore db using 
        model.User user = model.User(
          email: email,
          firstname: firstname,
          followers: [],
          following: [],
          lastname: lastname,
          photoUrl: profilePicUrl,
          sId: "",
          sex: sex,
          surnname: surnname!,
          type: type,
          uid: cred.user!.uid,
          username: '',
          subjectes: subjects!,
          grade: grade,
          school: school,
          status: false,
          state: 'Active',
        );
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    notifyListeners();
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    notifyListeners();
    return res;
  }

//signOut
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
