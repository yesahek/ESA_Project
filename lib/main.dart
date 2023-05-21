import 'package:e_sup_app/providers/leaders.dart';
import 'package:e_sup_app/providers/posts.dart';
import 'package:e_sup_app/providers/stud_materials.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'providers/text_books.dart';
import 'screens/main_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: StudMaterials(),
        ),
        ChangeNotifierProvider.value(
          value: Posts(),
        ),
        ChangeNotifierProvider.value(
          value: TextBooks(),
        ),
        ChangeNotifierProvider.value(
          value: Leaders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Edu-Sup',
        theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          //primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      ),
    );
  }
}
