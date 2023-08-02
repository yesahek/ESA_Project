import 'package:e_sup_app/models/assignment.dart';
import 'package:e_sup_app/providers/assignment_provider.dart';
import 'package:e_sup_app/providers/leaders.dart';
import 'package:e_sup_app/providers/posts_provider.dart';
import 'package:e_sup_app/providers/course_materials_provider.dart';
import 'package:e_sup_app/providers/school_provider.dart';
import 'package:e_sup_app/providers/users_provider.dart';
import 'package:e_sup_app/responsive/responsive_layout.dart';
import 'package:e_sup_app/responsive/web_screen_layout.dart';
import 'package:e_sup_app/responsive/mobile_screen_layout.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'providers/courses_provider.dart';
import 'providers/text_books.dart';
//import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
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
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: courseMaterialProvider(),
        ),
        ChangeNotifierProvider.value(
          value: PostProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TextBooks(),
        ),
        ChangeNotifierProvider.value(
          value: Leaders(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CoursesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: schoolProvider(),
        ),
         ChangeNotifierProvider.value(
          value: assignmentProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ESA',
        theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          //primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(),
                  mobileScreenLayout: MobileScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            //return const AuthScreen();
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
