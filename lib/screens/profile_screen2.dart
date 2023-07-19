import 'package:flutter/material.dart';

class ProfileScreen2 extends StatelessWidget {
  const ProfileScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = {};
    int postLen = 0;
    int followers = 0;
    int following = 0;
    bool isFollowing = false;
    bool isLoading = false;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: mobileBackgroundColor,
      //   title: Text(
      //     userData['username'],
      //   ),
      //   centerTitle: false,
      // ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                        'assets/profile.png',
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
                            children: [
                              // FirebaseAuth.instance.currentUser!.uid ==
                              //         widget.uid
                              //     ? 
                              // FollowButton(
                              //         text: 'Sign Out',
                              //         backgroundColor: mobileBackgroundColor,
                              //         textColor: primaryColor,
                              //         borderColor: Colors.grey,
                              //         function: () async {
                              //           await AuthMethods().signOut();
                              //           if (context.mounted) {
                              //             Navigator.of(context).pushReplacement(
                              //               MaterialPageRoute(
                              //                 builder: (context) =>
                              //                     const LoginScreen(),
                              //               ),
                              //             );
                              //           }
                              //         },
                              //       )
                              //     : isFollowing
                              //         ? FollowButton(
                              //             text: 'Unfollow',
                              //             backgroundColor: Colors.white,
                              //             textColor: Colors.black,
                              //             borderColor: Colors.grey,
                              //             function: () async {
                              //               await FireStoreMethods().followUser(
                              //                 FirebaseAuth
                              //                     .instance.currentUser!.uid,
                              //                 userData['uid'],
                              //               );

                              //               setState(() {
                              //                 isFollowing = false;
                              //                 followers--;
                              //               });
                              //             },
                              //           )
                              //         : FollowButton(
                              //             text: 'Follow',
                              //             backgroundColor: Colors.blue,
                              //             textColor: Colors.white,
                              //             borderColor: Colors.blue,
                              //             function: () async {
                              //               await FireStoreMethods().followUser(
                              //                 FirebaseAuth
                              //                     .instance.currentUser!.uid,
                              //                 userData['uid'],
                              //               );

                              //               setState(() {
                              //                 isFollowing = true;
                              //                 followers++;
                              //               });
                              //             },
                              //          )
                            ],
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
                    "User Name",
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
                    "bio",
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

          //     return GridView.builder(
          //       shrinkWrap: true,
          //       itemCount: (snapshot.data! as dynamic).docs.length,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 3,
          //         crossAxisSpacing: 5,
          //         mainAxisSpacing: 1.5,
          //         childAspectRatio: 1,
          //       ),
          //       itemBuilder: (context, index) {
          //         DocumentSnapshot snap =
          //             (snapshot.data! as dynamic).docs[index];

          //         return SizedBox(
          //           child: Image(
          //             image: NetworkImage(snap['postUrl']),
          //             fit: BoxFit.cover,
          //           ),
          //         );
          //       },
          //     );
          //   },
          // )
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
