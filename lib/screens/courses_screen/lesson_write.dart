import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter/material.dart';

class LessonWrite extends StatelessWidget {
  const LessonWrite({super.key});

  @override
  Widget build(BuildContext context) {
    QuillController _controller = QuillController.basic();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(backArrow: true, title: "Write Document", name: ''),
            QuillToolbar.basic(controller: _controller),
            Expanded(
              child: Container(
                child: QuillEditor.basic(
                  controller: _controller,
                  readOnly: false, // true for view only mode
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
