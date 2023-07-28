import 'package:flutter/material.dart';
import 'package:e_sup_app/screens/home_screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/users_provider.dart';
import '../screens/home_screens/events_screen.dart';
import '../screens/home_screens/friends_screen.dart';
import '../screens/home_screens/messages_screen.dart';
import '../screens/home_screens/saves_screen.dart';
import '../screens/home_screens/todo_screen.dart';
//import '../screens/profile_screen.dart';
import '../screens/profile_screen2.dart';
import '../screens/activity_screens/activity_screen.dart';
import '../screens/forum.dart';
import '../screens/likes_screen.dart';
import '../screens/courses_screen/courses_screen.dart';
import 'colors.dart';

const webScreenSize = 600;


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
