import 'package:e_sup_app/providers/posts_provider.dart';
import 'package:e_sup_app/widget/searchBar.dart';
import 'package:e_sup_app/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/my_appBar.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  var _isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchData(); // Call the async function to fetch data
  }

  fetchData() async {
    await Provider.of<PostProvider>(context, listen: false).fetchPosts();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<PostProvider>(context, listen: false);
    print(postData.item.length);
    print("i'm on fourm page");
    final searchController = TextEditingController();
    final String textHint = "search post";
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ))
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: [
                    MyAppBar(backArrow: false, title: "Feed", name: ""),
                    Search(
                      searchController: searchController,
                      textHint: textHint,
                    ),
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
          );
  }
}
