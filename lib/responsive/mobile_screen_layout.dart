import 'package:e_sup_app/providers/users.dart';
import 'package:e_sup_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart' as model;
import '../screens/waiting_screen.dart';
import '../utils/global_variables.dart';

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
              Icons.newspaper,
              color: _page == 1 ? appColor : secondaryColor,
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
              Icons.favorite,
              color: _page == 4 ? appColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 5 ? appColor : secondaryColor,
            ),
            label: '',
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
