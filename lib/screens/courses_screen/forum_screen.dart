// ignore_for_file: public_member_api_docs, sort_constructors_firs
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/posts_provider.dart';
import '../../widget/my_appBar.dart';
import '../../widget/my_button.dart';
import '../../widget/post_card.dart';

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
                Expanded(
                  flex: 6,
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromARGB(255, 243, 211, 115),
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ));
  }
}
