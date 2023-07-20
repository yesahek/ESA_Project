import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart' as model;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign up user
  signUpUser({
    required String username,
    required String firstname,
    required String lastname,
    required String surnname,
    required String type,
    required String sex,
    required String sId,
    required String photoUrl,
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          firstname.isNotEmpty ||
          lastname.isNotEmpty ||
          surnname.isNotEmpty ||
          type.isNotEmpty ||
          sex.isNotEmpty ||
          sId.isNotEmpty ||
          password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String pUrl = "";
        model.User user = model.User(
            email: email,
            firstname: firstname,
            followers: [],
            following: [],
            lastname: lastname,
            photoUrl: pUrl,
            sId: sId,
            sex: sex,
            surnname: surnname,
            type: "student",
            uid: cred.user!.uid,
            username: '');

//adding user in database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson() as Map<String, dynamic>);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
