import 'package:flutter/material.dart';

import '../models/leader.dart';

class Leaders with ChangeNotifier {
  List<Leader> _item = [
    Leader(
      leaderId: 'le01',
      userId: "userId",
      userName: "kebede Kebede",
      score: 86,
      grade: 8,
      section: 'A',
      school: "Medhanialem",
      date: DateTime(9, 7, 2023),
    ),
    Leader(
      leaderId: 'le02',
      userId: "userId",
      userName: "kebede abebe",
      grade: 7,
      school: "Addis Ketema",
      section: "B",
      score: 84,
      date: DateTime(9, 7, 2023),
    ),
    Leader(
      leaderId: 'le03',
      userId: "userId",
      userName: "Abebe kebede",
      grade: 8,
      school: "Medish",
      section: "B",
      score: 86,
      date: DateTime(9, 7, 2023),
    ),
    Leader(
      leaderId: 'le04',
      userId: "userId",
      userName: "Rahel haile",
      grade: 8,
      school: "Medhanialem",
      section: "A",
      score: 82,
      date: DateTime(9, 7, 2023),
    ),
    Leader(
      leaderId: 'le05',
      userId: "userId",
      userName: "Alemayehu Tadese",
      grade: 8,
      school: "Miraf",
      section: "A",
      score: 74,
      date: DateTime(9, 7, 2023),
    ),
    Leader(
      leaderId: 'le06',
      userId: "userId",
      userName: "kaki bedlue",
      grade: 8,
      school: "Miraf",
      section: "A",
      score: 74,
      date: DateTime(9, 7, 2023),
    ),
    Leader(
      leaderId: 'le07',
      userId: "userId",
      userName: "Gemberu Denberu",
      grade: 8,
      school: "Miraf",
      section: "A",
      score: 74,
      date: DateTime(9, 7, 2023),
    ),
    Leader(
      leaderId: 'le05',
      userId: "userId",
      userName: "Tadese Alemayehu",
      grade: 8,
      school: "Miraf",
      section: "A",
      score: 74,
      date: DateTime(9, 7, 2023),
    )
  ];

  List<Leader> get items {
    return [..._item];
  }

  notifyListeners();
}
