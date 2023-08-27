import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../widget/my_appBar.dart';

/// Represents Homepage for Navigation
class pdfPage extends StatefulWidget {
  final String courseTitle;
  final String fileUrl;
  pdfPage({
    Key? key,
    required this.courseTitle,
    required this.fileUrl,
  }) : super(key: key);
  @override
  _pdfPage createState() => _pdfPage();
}

class _pdfPage extends State<pdfPage> {
 // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyAppBar(
                backArrow: true,
                title: widget.courseTitle,
                name: ''
              ),
              // Expanded(
              //   child: SfPdfViewer.network(
              //     widget.fileUrl,
              //     key: _pdfViewerKey,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
