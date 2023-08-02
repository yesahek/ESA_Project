
// ignore_for_file: public_member_api_docs, sort_constructors_first
class TextBook {
  final String textBookId;
  final String textBookName;
  final String textBookCover;
  final int textBookGrade;
  final String textBookFile;

  TextBook({
    required this.textBookId,
    required this.textBookName,
    required this.textBookCover,
    required this.textBookGrade,
    required this.textBookFile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'textBookId': textBookId,
      'textBookName': textBookName,
      'textBookCover': textBookCover,
      'textBookGrade': textBookGrade,
      'textBookFile': textBookFile,
    };
  }

  Map<String, dynamic> toJson() => {
    'textBookId': textBookId,
      'textBookName': textBookName,
      'textBookCover': textBookCover,
      'textBookGrade': textBookGrade,
      'textBookFile': textBookFile,
  };
}
