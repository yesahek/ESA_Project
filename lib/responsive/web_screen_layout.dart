import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Web is on Constraction! :)"),
      ),
      // body: PageView(
      //   children: homeScreenItems,
      //   onPageChanged: onPageChanged,
      //   controller: pageController,
      // ),
      // bottomNavigationBar: CupertinoTabBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //         color: _page == 0 ? appColor : secondaryColor,
      //       ),
      //       label: '',
      //       backgroundColor: appColor,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.newspaper,
      //         color: _page == 1 ? appColor : secondaryColor,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.library_books_outlined,
      //         color: _page == 2 ? appColor : secondaryColor,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.leaderboard_outlined,
      //         color: _page == 3 ? appColor : secondaryColor,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.favorite,
      //         color: _page == 4 ? appColor : secondaryColor,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.person,
      //         color: _page == 5 ? appColor : secondaryColor,
      //       ),
      //       label: '',
      //     ),
      //   ],
      //   onTap: navigationTapped,
      //
      //
      // ),
    );
  }
}
