import 'package:flutter/material.dart';

import '../models/stud_material.dart';

class StudMaterials with ChangeNotifier {
  List<StudMaterial> _items = [
    StudMaterial(
      id: 'm1',
      title: 'Learn the besic Maths',
      authorId: "Desalgna",
      dept: "Matimatics",
      date: DateTime(2023, 05, 12),
      grade: 8,
      fileType: "pdf",
      fileUrl: '',
    ),
    StudMaterial(
      id: 'm2',
      title: 'English For Ethiopia',
      authorId: "Dr.Getachew",
      dept: "English",
      date: DateTime(2023, 05, 12),
      grade: 8,
      fileType: "Docx",
      fileUrl: '',
    ),
    StudMaterial(
      id: 'm3',
      title: 'Learn the besic Maths',
      authorId: "Dr.Getachew",
      dept: "Matimatics",
      date: DateTime(2023, 05, 12),
      grade: 2,
      fileType: "ppt",
      fileUrl: '',
    ),
    StudMaterial(
      id: 'm4',
      title: 'Fundamental of Maths',
      authorId: "Desalgna",
      dept: "Matimatics",
      date: DateTime(2023, 05, 12),
      grade: 5,
      fileType: "Pdf",
      fileUrl: '',
    ),
    StudMaterial(
      id: 'm5',
      title: 'Ethiopia',
      authorId: "Dr.Teferi",
      dept: "History",
      date: DateTime(2023, 05, 12),
      grade: 7,
      fileType: "pdf",
      fileUrl: '',
    ),
    StudMaterial(
      id: 'm6',
      title: 'Learn the besic Maths',
      authorId: "Dr.Getachew",
      dept: "Matimatics",
      date: DateTime(2023, 05, 12),
      grade: 3,
      fileType: "docx",
      fileUrl: '',
    ),
  ];

  // get

  List<StudMaterial> get items {
    return [..._items];
  }

  void addMaterial(newMaterial) {
    _items.add(newMaterial);
    notifyListeners();
  }

  notifyListeners();
}
