import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import '../models/text_book.dart';
import '../resources/storage_methods.dart';

class TextBooks with ChangeNotifier {
  List<TextBook> _items = [
    TextBook(
      textBookId: "tx01",
      textBookName: "English",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Course%20Materials%2FV96zvb8n78TnMaambrGrHwfKf6h2%2FOS%20Chapter%20Five.doc.pdf?alt=media&token=5521db82-095b-4814-9d10-2aa73749472d",
    ),
    TextBook(
      textBookId: "tx02",
      textBookName: "Civics",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 8,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Course%20Materials%2FV96zvb8n78TnMaambrGrHwfKf6h2%2FOS%20Chapter%20Two%20.pdf?alt=media&token=cd29f344-2b78-4c21-9670-06c2ea92f689",
    ),
    TextBook(
      textBookId: "tx03",
      textBookName: "Maths",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 3,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Course%20Materials%2FV96zvb8n78TnMaambrGrHwfKf6h2%2FOS%20Chapter%20Two%20.pdf?alt=media&token=80a29e4b-87b8-4305-a9bd-2a37012a0646",
    ),
    TextBook(
      textBookId: "tx04",
      textBookName: "Biology",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Course%20Materials%2FV96zvb8n78TnMaambrGrHwfKf6h2%2FOS%20Chapter%20Five.doc.pdf?alt=media&token=5521db82-095b-4814-9d10-2aa73749472d",
    ),
    TextBook(
      textBookId: "tx05",
      textBookName: "Chemistry",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Text%20Books%2F12%2FOS%20Chapter%20Three.pdf?alt=media&token=c7dd55b5-0ac0-4776-81cb-1a4257a52153",
    ),
    TextBook(
      textBookId: "tx06",
      textBookName: "History",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Text%20Books%2F12%2FCode%20Optimization.pdf?alt=media&token=3b008e03-b82a-4ced-8bac-a525fa747b65",
    ),
    TextBook(
      textBookId: "tx07",
      textBookName: "Physics",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Text%20Books%2F12%2FOS%20Chapter%20Four.pdf?alt=media&token=3c22e4a2-9674-453b-8f32-e2fe5eaa4898",
    ),
    TextBook(
      textBookId: "tx08",
      textBookName: "English",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Text%20Books%2F12%2FOS%20Chapter%20Three.pdf?alt=media&token=c7dd55b5-0ac0-4776-81cb-1a4257a52153",
    ),
    TextBook(
      textBookId: "tx09",
      textBookName: "Amharic",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 3,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Text%20Books%2F12%2FGrowthMindsetInterview-210528-224709.pdf?alt=media&token=92af1a49-016a-4f45-83c1-a599314440d4",
    ),
    TextBook(
      textBookId: "tx10",
      textBookName: "Maths",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 3,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Text%20Books%2F12%2FGrowthMindsetInterview-210528-224709.pdf?alt=media&token=92af1a49-016a-4f45-83c1-a599314440d4",
    ),
    TextBook(
      textBookId: "tx11",
      textBookName: "Biology",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Text%20Books%2F12%2FOS%20Chapter%20Four.pdf?alt=media&token=3c22e4a2-9674-453b-8f32-e2fe5eaa4898",
    ),
    TextBook(
      textBookId: "tx11",
      textBookName: "Chemistry",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile:
          "https://firebasestorage.googleapis.com/v0/b/esa-project-99df9.appspot.com/o/Text%20Books%2F12%2FOS%20Chapter%20Three.pdf?alt=media&token=c7dd55b5-0ac0-4776-81cb-1a4257a52153",
    ),
  ];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // List<TextBook> _items = [];
  List<TextBook> get item {
    return [..._items];
  }

  void addTextBook(newTextBook) {
    _items.add(newTextBook);
    notifyListeners();
  }

  Future<String> uploadTextBook(String title, String grade, File file) async {
  //  String? fileType = lookupMimeType(file.path);
    String res = "Some error occurred";
    try {
      String FileUrl = await StorageMethods()
          .uploadFileToStorage("Text Books", grade, title, file);
      String textBookId = const Uuid().v1(); // creates unique id based on time
      TextBook textBook = TextBook(
        textBookId: textBookId,
        textBookCover: 'assets/Images/moeLogo.png',
        textBookFile: FileUrl,
        textBookGrade: grade as int,
        textBookName: title,
      );
      _firestore
          .collection("text Books")
          .doc(textBookId)
          .set(textBook.toJson());
      TextBooks().addTextBook(textBook);

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    notifyListeners();
    return res;
  }
}
