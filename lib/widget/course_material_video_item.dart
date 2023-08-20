// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/screens/video_player_screen.dart';
import 'package:flutter/material.dart';

import '../screens/pdf_view_screen.dart';
import '../utils/colors.dart';

class courseVideoItem extends StatefulWidget {
  final String materialId;
  final String videoUrl;
  final String title;
  final String courseId;
  final String courseName;
  const courseVideoItem({
    Key? key,
    required this.materialId,
    required this.videoUrl,
    required this.title,
    required this.courseId,
    required this.courseName,
  }) : super(key: key);

  @override
  State<courseVideoItem> createState() => _courseVideoItemState();
}

class _courseVideoItemState extends State<courseVideoItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    void _press() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              VideoPlayerScreen(widget.videoUrl, widget.title),
        ),
      );
    }

    return GestureDetector(
      onTap: _press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        margin: EdgeInsets.only(bottom: 16),
        width: size.width - 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 2),
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
            Icon(
              Icons.play_arrow_sharp,
              color: Colors.red,
              size: 25,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: " - ${widget.title}",
                    style: TextStyle(
                      fontSize: 16,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    //text: "    ${widget.courseName}",
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
      ),
    );
  }
}
