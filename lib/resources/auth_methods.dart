import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart' as model;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign up user
  Future<String> signUpUser({
    String? username,
    required String firstname,
    required String lastname,
    required String surnname,
    required String type,
    required String sex,
    String? sId,
    String? photoUrl,
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          firstname.isNotEmpty ||
          lastname.isNotEmpty ||
          surnname.isNotEmpty ||
          type.isNotEmpty ||
          sex.isNotEmpty ||
          password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!);
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
          surnname: surnname,
          type: "student",
          uid: cred.user!.uid,
          username: '',
          password: password,
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
}
