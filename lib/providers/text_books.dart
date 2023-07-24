import 'package:flutter/material.dart';

import '../models/text_book.dart';

class TextBooks with ChangeNotifier {
  List<TextBook> _items = [
    TextBook(
      textBookId: "tx01",
      textBookName: "English",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx02",
      textBookName: "Civics",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 8,
      textBookFile:
          "https://drive.google.com/file/d/10eBBuqRr1b16zWjpxWFxaPzzUUOR05Xj/view?usp=sharing",
    ),
    TextBook(
      textBookId: "tx03",
      textBookName: "Maths",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 3,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx04",
      textBookName: "Biology",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx05",
      textBookName: "Chemistry",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx06",
      textBookName: "History",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx07",
      textBookName: "Physics",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx08",
      textBookName: "English",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx09",
      textBookName: "Amharic",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 3,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx10",
      textBookName: "Maths",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 3,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx11",
      textBookName: "Biology",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile: "",
    ),
    TextBook(
      textBookId: "tx11",
      textBookName: "Chemistry",
      textBookCover: 'assets/Images/moeLogo.png',
      textBookGrade: 5,
      textBookFile: "",
    ),
  ];
  List<TextBook> get item {
    return [..._items];
  }
}
