import 'package:flutter/material.dart';

import '../models/stud_material.dart';

class StudMaterials with ChangeNotifier {
  List<StudMaterial> _items = [
    StudMaterial(
      id: 'm1',
      title: 'Learn the besic Maths',
      author: "Desalgna",
      dept: "Matimatics",
      date: DateTime(2023, 05, 12),
      grade: 8,
      authorSchool: "Medhanialem",
      fileType: "pdf",
    ),
    StudMaterial(
      id: 'm2',
      title: 'English For Ethiopia',
      author: "Dr.Getachew",
      dept: "English",
      date: DateTime(2023, 05, 12),
      grade: 8,
      authorSchool: "Addis Ketema",
      fileType: "Docx",
    ),
    StudMaterial(
      id: 'm3',
      title: 'Learn the besic Maths',
      author: "Dr.Getachew",
      dept: "Matimatics",
      date: DateTime(2023, 05, 12),
      grade: 2,
      authorSchool: "Medehanialem",
      fileType: "ppt",
    ),
    StudMaterial(
      id: 'm4',
      title: 'Fundamental of Maths',
      author: "Desalgna",
      dept: "Matimatics",
      date: DateTime(2023, 05, 12),
      grade: 5,
      authorSchool: "Addis Ketema",
      fileType: "Pdf",
    ),
    StudMaterial(
      id: 'm5',
      title: 'Ethiopia',
      author: "Dr.Teferi",
      dept: "History",
      date: DateTime(2023, 05, 12),
      grade: 7,
      authorSchool: "Kelem Amba",
      fileType: "pdf",
    ),
    StudMaterial(
      id: 'm6',
      title: 'Learn the besic Maths',
      author: "Dr.Getachew",
      dept: "Matimatics",
      date: DateTime(2023, 05, 12),
      grade: 3,
      authorSchool: "Addis Ketema",
      fileType: "docx",
    ),
  ];

  // get

  List<StudMaterial> get items {
    return [..._items];
  }

  void addMaterial(newMaterial) {
    _items.add(newMaterial);
  }

  notifyListeners();
}
