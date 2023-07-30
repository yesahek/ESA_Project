import 'package:e_sup_app/models/user.dart' as model;
import 'package:e_sup_app/screens/profile_detail_screen.dart';
import 'package:e_sup_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users_provider.dart';
import '../screens/activity_screens/activity_screen.dart';
import '../screens/add_post_screen.dart';
import '../screens/courses_screen/courses_screen.dart';
import '../screens/home_screens/home_screen.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
  }

  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    model.User user = userProvider.getUser;
    var homeScreenItems = [
      HomeScreen(),

      MaterialsScreen(),
      //FeedScreen(),
      //ActivityScreen(),
      AddPost(),
      ProfileDetailPage(
          firstName: user.firstname,
          lastName: user.lastname,
          type: user.type,
          sex: user.sex,
          photoUrl: user.photoUrl,
          email: user.email,
          grade: user.grade,
          phoneNumber: user.phone,
          shoolName: user.school,
          userId: user.uid,
          isEditButton: true)
    ];

    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        onPageChanged: onPageChanged,
        controller: pageController,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? appColor : secondaryColor,
            ),
            label: '',
            backgroundColor: appColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books_outlined,
              color: _page == 2 ? appColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard_outlined,
              color: _page == 3 ? appColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 4 ? appColor : secondaryColor,
            ),
            label: '',
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}

// Home buttons class
class HomeButtons {
  String name;
  Icon icon;
  Widget widget;
  int notifcation;
  HomeButtons({
    required this.name,
    required this.icon,
    required this.widget,
    required this.notifcation,
  });
}
