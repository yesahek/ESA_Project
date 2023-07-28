
import 'package:flutter/material.dart';

class BookReadingPage extends StatefulWidget {
  final String pdfFilePath;

  const BookReadingPage({required this.pdfFilePath});

  @override
  _BookReadingPageState createState() => _BookReadingPageState();
}

class _BookReadingPageState extends State<BookReadingPage> {
  List<String> _pagesContent = [];

  @override
  void initState() {
    super.initState();
    _loadPdfContent();
  }

  Future<List<String>> parsePdfContent(String path) async {
  // final file = File(path);
  // final document = await PdfDocument.fromFile(file);


  List<String> content = [];

  // for (var page in file.pages) {
  //   final pageContent = await page.extractText();
  //   content.add(pageContent);
  // }

  return content;
}

  Future<void> _loadPdfContent() async {
    final content = await parsePdfContent(widget.pdfFilePath);
    setState(() {
      _pagesContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Reading Page'),
      ),
      body: PageView.builder(
        itemCount: _pagesContent.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(_pagesContent[index]),
            ),
          );
        },
      ),
    );
  }
}
