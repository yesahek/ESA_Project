import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart' as model;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
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
    required String grade,
    required String school,
    List<String>? subjects,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          firstname.isNotEmpty ||
          lastname.isNotEmpty ||
          grade.isNotEmpty ||
          type.isNotEmpty ||
          sex.isNotEmpty ||
          password.isNotEmpty ||
          school.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // print(cred.user!);
        String profilePicUrl = "_default";
        //School id fetch from database using school name

        model.User user = model.User(
          email: email,
          firstname: firstname,
          followers: [],
          following: [],
          lastname: lastname,
          photoUrl: profilePicUrl,
          sId: "mukera_school_Id",
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
    return res;
  }

  // signOut

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
