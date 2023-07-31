// ignore_for_file: public_member_api_docs, sort_constructors_firs
import 'package:e_sup_app/screens/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/posts_provider.dart';
import '../../widget/my_appBar.dart';
import '../../widget/post_card.dart';

class forumScreen extends StatefulWidget {
  const forumScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<forumScreen> createState() => _forumScreenState();
}

class _forumScreenState extends State<forumScreen> {
  var _isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Provider.of<PostProvider>(context, listen: false).fetchPosts();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
// Add new material button
//     void _startAddNewPost( ) {
//     showModalBottomSheet(
//       context: ctx,
//       builder: (_) {
//         return GestureDetector(
//           onTap: () {},
//           child: AddNewMaterial(sId, uid, courseId, grade),
//           behavior: HitTestBehavior.opaque,
//         );
//       },
//     );
// }

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
                  title: "Forum of ....",
                  name: '',
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AddPost(),
                        ));
                  },
                  child: Container(
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
          onPressed: () => MaterialPageRoute(
            builder: (context) => AddPost(),
          ),
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
