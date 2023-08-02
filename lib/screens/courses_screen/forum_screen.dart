// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs, sort_constructors_firs
import 'package:e_sup_app/screens/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/posts_provider.dart';
import '../../widget/my_appBar.dart';
import '../../widget/post_card.dart';

class forumScreen extends StatefulWidget {
  final String courseId;
  final String courseTitle;
  const forumScreen({
    Key? key,
    required this.courseId,
    required this.courseTitle,
  }) : super(key: key);

  @override
  State<forumScreen> createState() => _forumScreenState();
}

class _forumScreenState extends State<forumScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Provider.of<PostProvider>(context, listen: false).fetchPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<PostProvider>(context, listen: false)
        .findByCourseId(widget.courseId);
    // final searchController = TextEditingController();
    // final String textHint = "search post";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                backArrow: true,
                title: "Forum of ${widget.courseTitle}",
                name: '',
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AddPost(courseId: widget.courseId),
                      ));
                },
                child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text("Add New Post"),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: ListView.builder(
                  itemCount: postData.length,
                  itemBuilder: (context, index) => PostCard(
                    postData[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
