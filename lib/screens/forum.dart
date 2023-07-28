import 'package:e_sup_app/providers/posts.dart';
import 'package:e_sup_app/widget/searchBar.dart';
import 'package:e_sup_app/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/my_appBar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<Posts>(context, listen: false);
    final searchController = TextEditingController();
    final String textHint = "search post";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              MyAppBar(backArrow: false,title: "Feed",name: ""),
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
