import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sup_app/resources/storage_methods.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

import '../models/course_material.dart';
import '../providers/course_materials_provider.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // upload materials in storage and firstore
  Future<String> uploadMaterial(String title, String description, int grade,
      String courseId, String uid, File file) async {
       String? fileType = lookupMimeType(file.path); 
    String res = "Some error occurred";
    try {
      String FileUrl = await StorageMethods()
          .uploadFileToStorage("Student Materials", uid, title, file);
      String studMaterialId =
          const Uuid().v1(); // creates unique id based on time
      courseMaterial studMaterial = courseMaterial(
          id: studMaterialId,
          title: title,
          grade: grade,
          authorId: uid,
          date: DateTime.now(),
          courseId: courseId,
          fileType: fileType!,
          fileUrl:FileUrl.toString()  );
      _firestore.collection("Student Materials").doc(studMaterialId).set(studMaterial.toJson());
       courseMaterialProvider().addMaterial(studMaterial);
      
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //fetch And Set courses

}
