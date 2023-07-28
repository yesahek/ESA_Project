import 'package:e_sup_app/models/user.dart';
import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/widget/my_appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen2 extends StatelessWidget {
  const ProfileScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userData = Provider.of<UserProvider>(context, listen: false);
    User user = userData.getUser;
    int postLen = 0;
    int followers = user.followers.length;
    int following = user.following.length;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                MyAppBar(backArrow: false, title: "Profile", name: ''),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                        "assets/Images/default.jpg",
                      ),
                      radius: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildStatColumn(postLen, "posts"),
                              buildStatColumn(followers, "followers"),
                              buildStatColumn(following, "following"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text(
                    user.firstname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: Text(
                    user.username,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // FutureBuilder(
          //   future: FirebaseFirestore.instance
          //       .collection('posts')
          //       .where('uid', isEqualTo: widget.uid)
          //       .get(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }

          // return
          ListView.separated(
            shrinkWrap: true,

            itemCount: 8,
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 3,
            //   crossAxisSpacing: 5,
            //   mainAxisSpacing: 1.5,
            //   childAspectRatio: 1,
            // ),
            itemBuilder: (context, index) {
              // DocumentSnapshot snap =
              //     (snapshot.data! as dynamic).docs[index];

              // return Column(
              //   children: [
              //     SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.35,
              //       width: double.infinity,
              //       child: Image(
              //         image: NetworkImage('assets/tumb.jpg'),
              //         //fit: BoxFit.cover,
              //       ),
              //     ),
              //   ],
              // );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ],
      ),
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
