import 'package:flutter/material.dart';
import 'package:e_sup_app/screens/home_screens/home_screen.dart';

import '../screens/home_screens/events_screen.dart';
import '../screens/home_screens/friends_screen.dart';
import '../screens/home_screens/messages_screen.dart';
import '../screens/home_screens/saves_screen.dart';
import '../screens/home_screens/todo_screen.dart';
//import '../screens/profile_screen.dart';
import '../screens/profile_screen2.dart';
import 'home_button.dart';
import '../screens/activity_screens/activity_screen.dart';
import '../screens/feed_screen.dart';
import '../screens/likes_screen.dart';
import '../screens/courses_screen/courses_screen.dart';
import 'colors.dart';

const webScreenSize = 600;

const homeScreenItems = [
  HomeScreen(),
  MaterialsScreen(),
  FeedScreen(),
  ActivityScreen(),
  LikesScreen(),
  ProfileScreen2(),
];

List<HomeButtons> tools = [
  HomeButtons(
    name: "Messages",
    widget: MessagesScreen(),
    notifcation: 2,
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
    name: "Events",
    widget: EventsScreen(),
    notifcation: 3,
    icon: Icon(
      Icons.event_outlined,
      color: iconColor,
      size: 30,
    ),
  ),
  HomeButtons(
    name: "Todo",
    widget: TodoScreen(),
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

List leaders = [
  {
    'name': 'isaac',
    'leadingType': 'all School',
    'score': 98,
  },
  {
    'name': 'yesahek',
    'leadingType': 'Your Section',
    'score': 88,
  },
  {
    'name': 'ukee',
    'leadingType': 'All Section',
    'score': 91,
  }
];
