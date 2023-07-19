import 'package:e_sup_app/models/post.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/colors.dart';
import 'choice.dart';

class PostCard extends StatelessWidget {
  final Post item;

  PostCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU",
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            ),
          ),
          //Content section
          GestureDetector(
            onDoubleTap: () {
              // setState(() {
              //   isLikedAnimating = true;
              // });
            },
            //Post Content Area
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    item.imageUrl == ''
                        ? item.description == ''
                            ? Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black54,
                                  ),
                                ),
                                child: Text(
                                  item.description,
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              )
                            : Divider()
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: double.infinity,
                            child: Image.network(
                              item.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          )
                  ],
                ),
                item.question?.question == null
                    ? Text(item.description)
                    : Container(
                        //color: Colors.blueGrey,
                        padding: EdgeInsets.only(top: 8, left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          //color: Colors.blueGrey,
                        ),
                        child: Column(
                          children: [
                            Text(
                              item.question!.question + " ?",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            item.question?.choice == null
                                ? Divider()
                                : ListView.builder(
                                    physics: ScrollPhysics(),
                                    //scrollDirection: ,
                                    shrinkWrap: true,
                                    itemCount: item.question?.choice?.length,
                                    itemBuilder: (_, i) => Column(
                                      children: [
                                        Choice(
                                          item: item,
                                          choice: item.question?.choice?[i],
                                          ind: i,
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      )
              ],
            ),
          ),
          //Like , Comment Section
          Row(
            children: [
              //Like button
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),

              // Comment button
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment_outlined,
                ),
              ),

              //share button
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                ),
              ),

              //save post button
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //Description and number of comments

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                  child: Text(
                    "20 Likes",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'username',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'description',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: const Text(
                      "View all 100 Comments",
                      style: TextStyle(fontSize: 16, color: secondaryColor),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "20/12/2015",
                    style: TextStyle(fontSize: 16, color: secondaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
