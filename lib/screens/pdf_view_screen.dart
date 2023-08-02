// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../widget/my_appBar.dart';

/// Represents Homepage for Navigation
class pdfPage extends StatefulWidget {
  final String courseTitle;
  final String courseName;
  final String firstName;
  final String author;
  final String materialTitle;
  final String fileUrl;
  pdfPage({
    Key? key,
    required this.courseTitle,
    required this.courseName,
    required this.firstName,
    required this.author,
    required this.materialTitle,
    required this.fileUrl,
  }) : super(key: key);
  @override
  _pdfPage createState() => _pdfPage();
}

class _pdfPage extends State<pdfPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyAppBar(
                  backArrow: true,
                  title: widget.courseTitle,
                  name: widget.firstName,
                ),
                Column(
                  children: [
                    Expanded(
                      child: SfPdfViewer.network(
                        widget.fileUrl,
                        key: _pdfViewerKey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
