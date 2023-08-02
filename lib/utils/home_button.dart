// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../responsive/mobile_screen_layout.dart';
import '../screens/home_screens/educators_screens.dart';
import '../screens/home_screens/students_screen.dart';
import '../screens/home_screens/notification_screen.dart';
import '../screens/home_screens/reports_screen.dart';
import '../screens/home_screens/requests_screen.dart';
import '../screens/home_screens/saves_screen.dart';
import '../screens/home_screens/assignmnet_screen.dart';
import 'colors.dart';

//*******Home Screen Buttens List******* */
//For Students
List<HomeButtons> tools = [
  HomeButtons(
    name: "Assignmnet",
    widget: AssignmnetScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.message_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Friends",
    widget: FriendsScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.people_outline,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Educators",
    widget: educatorsScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.list_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Notifcations",
    widget: NotificationScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.notifications_none_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Saves",
    widget: SavesScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.bookmark_outline,
      color: iconColor,
      size: 30,
    ),
  ),
];

//For Educator

List<HomeButtons> toolsForEducator = [
  HomeButtons(
    name: "assignment",
    widget: AssignmnetScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.message_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Student",
    widget: FriendsScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.people_outline,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Notifcations",
    widget: NotificationScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.notifications_none_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Educators",
    widget: educatorsScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.list_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Saves",
    widget: SavesScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.bookmark_outline,
      color: iconColor,
      size: 30,
    ),
  ),
];

//Tools for Admin
List<HomeButtons> toolsForAdmin = [
  HomeButtons(
    name: "Reports",
    widget: ReportsScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.message_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Student",
    widget: FriendsScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.people_outline,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Educators",
    widget: educatorsScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.list_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Notifcations",
    widget: NotificationScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.notifications_none_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Requests",
    widget: RequestScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.question_mark,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Saves",
    widget: SavesScreen(),
    notifcation: 0,
    icon: Icon(
      Icons.bookmark_outline,
      color: iconColor,
      size: 30,
    ),
  ),
];
