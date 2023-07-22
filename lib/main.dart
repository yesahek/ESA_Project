import 'package:e_sup_app/providers/leaders.dart';
import 'package:e_sup_app/providers/posts.dart';
import 'package:e_sup_app/providers/stud_materials.dart';
import 'package:e_sup_app/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'providers/text_books.dart';
//import 'screens/main_screen.dart';
import 'utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDkbCvF9EV-dXTbZJMb7MwHGP7DIdkwPl8",
            //authDomain: "esa-project-99df9.firebaseapp.com",
            projectId: "esa-project-99df9",
            storageBucket: "esa-project-99df9.appspot.com",
            messagingSenderId: "1081573793838",
            appId: "1:1081573793838:web:563075de4b1786dc997fbf"));
  } else {}
  runApp(MyApp());
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
        home: AuthScreen(),
        //home: MainScreen(),
      ),
    );
  }
}
