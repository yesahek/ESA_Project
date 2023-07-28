// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_sup_app/resources/storage_methods.dart';
// import 'package:mime/mime.dart';
// import 'package:uuid/uuid.dart';

// import '../models/course_material.dart';
// import '../providers/course_materials_provider.dart';

import 'dart:typed_data';

import 'package:e_sup_app/resources/storage_methods.dart';

class FireStoreMethods {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // // upload materials in storage and firstore
  // Future<String> uploadMaterial(String title, String description, int grade,
  //     String courseId, String uid, File file) async {
  //      String? fileType = lookupMimeType(file.path); 
  //   String res = "Some error occurred";
  //   try {
  //     String FileUrl = await StorageMethods()
  //         .uploadFileToStorage("Student Materials", uid, title, file);
  //     String studMaterialId =
  //         const Uuid().v1(); // creates unique id based on time
  //     courseMaterial CourseMaterial = courseMaterial(
  //         id: studMaterialId,
  //         title: title,
  //         grade: grade,
  //         authorId: uid,
  //         date: DateTime.now().,
  //         courseId: courseId,
  //         fileType: fileType!,
  //         fileUrl:FileUrl.toString()  );
  //     _firestore.collection("Course Materials").doc(studMaterialId).set(CourseMaterial.toJson());
  //      courseMaterialProvider().addMaterial(CourseMaterial);
      
  //     res = "success";
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

  //fetch And Set courses

// Future<String> uploadPost(String description, Uint8List file, String uid,
//       String username, String profImage) async {
//     // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
//     String res = "Some error occurred";
//     try {
//       String photoUrl =
//           await StorageMethods().uploadImageToStorage('posts', file, true);
//       String postId = const Uuid().v1(); // creates unique id based on time
//       Post post = Post(
//         description: description,
//         uid: uid,
//         username: username,
//         likes: [],
//         postId: postId,
//         datePublished: DateTime.now(),
//         postUrl: photoUrl,
//         profImage: profImage,
//       );
//       _firestore.collection('posts').doc(postId).set(post.toJson());
//       res = "success";
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
}
