// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class LessonReadingPage extends StatefulWidget {
  final String title;
  final String content;
  const LessonReadingPage({
    Key? key,
    required this.title,
    required this.content,
  });

  @override
  State<LessonReadingPage> createState() => _LessonReadingPageState();
}

class _LessonReadingPageState extends State<LessonReadingPage> {
  @override
  void initState() {
    super.initState();
    Delta contentDelta = Delta.fromJson(jsonDecode(widget.content));
    _controller = QuillController(
      document: Document.fromDelta(
          contentDelta), // Assuming content is in Quill Delta JSON format
      selection: TextSelection.collapsed(offset: 0),
    );
  }

  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(backArrow: true, title: widget.title, name: ''),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: QuillEditor(
                  controller: _controller,
                  readOnly: true,
                  autoFocus: false,
                  focusNode: FocusNode(),
                  scrollController: ScrollController(),
                  scrollable: true,
                  padding: EdgeInsets.zero,
                  expands: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
