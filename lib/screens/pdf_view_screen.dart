// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';

class PdfViewerScreen extends StatefulWidget {
  final String fileUrl;
  final String fileName;
  const PdfViewerScreen({
    Key? key,
    required this.fileUrl,
    required this.fileName,
  }) : super(key: key);
  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late File Pfile;
  bool isLoading = false;
  Future<void> loadNetwork() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(widget.fileUrl));
    final bytes = response.bodyBytes;
    final filename = basename(widget.fileUrl);
    final dir;
    //= await getApplicationDocumentsDirectory();
    var file ;
    //= File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      Pfile = file;
    });

    print(Pfile);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadNetwork();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.fileName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Center(
                // child: PDFView(
                //   filePath: Pfile.path,
                // ),
              ),
            ),
    );
  }
}
