import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart' as model;
import '../resources/storage_methods.dart';

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
    phone: '',
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  model.User get getUser => _user;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    try {
      DocumentSnapshot snap =
          await _firestore.collection("users").doc(currentUser.uid).get();

      return model.User.fromSnap(snap);
    } catch (e) {
      // Handle any errors that occur during fetching.
      print('Error fetching user details: $e');
      // Rethrow the error or handle it accordingly.
      throw e;
    }
  }

//for admin to approving users
  Future<String> acceptUser(String uId) async {
    String res = "";
    try {
      // Update the 'status' field to true for the user with the specified ID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update({'status': true});
      notifyListeners();
      res = "success";
    } catch (e) {
      // Handle any errors that occur during the update process
      print('Error updating profile: $e');
      res = "Error updating profile";
    }
    return res;
  }

//for Admin Users list unApproved users
  Future<List<model.User>> getUsersBySchoolId(String SID) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection("users")
          .where("sId", isEqualTo: SID)
          .get();
      // Create a list to collect the matching users.
      List<model.User> users = [];

      // Iterate through the snapshots to create User objects and add them to the list.
      for (DocumentSnapshot userSnapshot in snapshot.docs) {
        users.add(model.User.fromSnap(userSnapshot));
      }

      // Return the list of users.
      return users;
    } catch (e) {
      // Handle any errors that occur during fetching.
      print('Error fetching user details: $e');
      // Rethrow the error or handle it accordingly.
      throw e;
    }
  }

//finding requestes of school in admin
  Future<List<model.User>> requestsForSchool(String schoolId) async {
    try {
      List<model.User> users =
          await UserProvider().getUsersBySchoolId(schoolId);
      List<model.User> filteredUsers =
          users.where((user) => user.status == false).toList();
      return filteredUsers;
    } catch (e) {
      print("Error: $e");
      return []; // Return an empty list if there's an error
    }
  }

//Find and retrieve the user information
  Future<model.User?> getUserById(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
          await _firestore.collection("users").doc(userId).get();
      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        return model.User.fromSnap(userSnapshot);
      } else {
        print("user not Found");
        return null;
      }
    } catch (e) {
      print("Error fetching user by ID: $e");
      return null;
    }
  }
  

//for checking if the user Tabel have change
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
    String? photoUrl,
    required String email,
    required String password,
    required int grade,
    required String school,
    List<String>? subjects,
    required String phone,
    required String sId,
    required Uint8List file,
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
          school.isNotEmpty ||
          phone.isNotEmpty ||
          file != null) {
        //signuping on FirebaseAuth and store the user Credential on cred
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //uplaoding profile picture
        String photoUrl = await StorageMethods()
            .uploadImageToStorage("profilePics", file, false);

// storing information on firestore db using
        model.User user = model.User(
          email: email,
          firstname: firstname,
          followers: [],
          following: [],
          lastname: lastname,
          photoUrl: photoUrl,
          sId: sId,
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
          phone: phone,
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
