// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/screens/book_reader_screen.dart';
import 'package:flutter/material.dart';

import '../screens/pdf_view_screen.dart';
import '../utils/colors.dart';

class courseMaterialItem extends StatefulWidget {
  final String materialId;
  final String fileUrl;
  final DateTime date;
  final String title;
  final String author;
  final String courseId;
  final int gr;
  final String fileType;
  final String courseName;
  const courseMaterialItem({
    Key? key,
    required this.materialId,
    required this.fileUrl,
    required this.date,
    required this.title,
    required this.author,
    required this.courseId,
    required this.gr,
    required this.fileType,
    required this.courseName,
  }) : super(key: key);

  @override
  State<courseMaterialItem> createState() => _courseMaterialItemState();
}

class _courseMaterialItemState extends State<courseMaterialItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    void _press() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pdfPage(
              courseTitle: widget.courseName,
              firstName: widget.author,
              materialTitle: widget.title,
              author: widget.author,
              courseName: widget.courseName,
              fileUrl: widget.fileUrl),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: widget.courseName,
                  style: TextStyle(color: kLightBlackColor),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: _press,
          )
        ],
      ),
    );
  }
}
