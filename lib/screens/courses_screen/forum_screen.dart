// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_sup_app/screens/add_post_to_forum_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';

import '../../providers/posts_provider.dart';
import '../../widget/my_appBar.dart';
import '../../widget/post_card.dart';
import '../../widget/searchBar.dart';

class forumScreen extends StatelessWidget {
  final String courseId;
  final String courseTitle;
  const forumScreen({
    Key? key,
    required this.courseId,
    required this.courseTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//Add new material button
    //void _startAddNewPost( ) {
    // showModalBottomSheet(
    //   context: ctx,
    //   builder: (_) {
    //     return GestureDetector(
    //       onTap: () {},
    //       child: AddNewMaterial(sId, uid, courseId, grade),
    //       behavior: HitTestBehavior.opaque,
    //     );
    //   },
    // );
//}

    final postData = Provider.of<PostProvider>(context, listen: false);
    final searchController = TextEditingController();
    final String textHint = "search post";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                backArrow: true,
                title: "Forum of $courseTitle",
                name: '',
              ),
              // Search(
              //   searchController: searchController,
              //   textHint: textHint,
              // ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: postData.item.length,
                  itemBuilder: (context, index) => PostCard(
                    postData.item[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => AddPostScreen(grade: 12,
      //         userName: "",
      //           courseId: courseId,
      //           courseName: courseTitle,
      //         ),
      //       ),
      //     )
      //   },
      //   backgroundColor: Colors.blue,
      //   child: Icon(
      //     Icons.add,
      //   ),
      // ),
    );
  }
}
