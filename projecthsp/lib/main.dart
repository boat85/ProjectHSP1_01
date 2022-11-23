import 'package:flutter/material.dart';

import 'Screens/home.dart';
import 'Screens/login/BMIregister.dart';
import 'Screens/login/login.dart';
import 'Screens/menu/mainmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HSP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Prompt',
      ),
      // home: homeScreen(),
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginScreen(),
        '/mainMenu': (context) => mainMenu(),
        '/home': (context) => homeScreen(),
        '/BMIRGTScreen': (context) => BMIRGTScreen(),
        // '/resetpass': (context) => ResetpassPage(),
        // '/score': (context) => ScorePage(total: 0.0, grade: ''),
      },
    );
  }
}
