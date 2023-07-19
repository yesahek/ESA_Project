// import 'package:e_sup_app/screens/pdf_view_screen.dart';
import 'package:e_sup_app/widget/text_book_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/text_books.dart';

class TextBookGrid extends StatelessWidget {
  const TextBookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final textBooks = Provider.of<TextBooks>(context, listen: false);
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(05.0),
        itemCount: textBooks.item.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 30,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PdfViewerScreen(
            //       fileName: textBooks.item[i].textBookName,
            //       fileUrl: textBooks.item[i].textBookFile,
            //     ),
            //   ),
            // );
          },
          child: TextBookItem(
            bookId: textBooks.item[i].textBookId,
            bookTitle: textBooks.item[i].textBookName,
            bookCover: textBooks.item[i].textBookCover,
          ),
        ),
      ),
    );
  }
}
