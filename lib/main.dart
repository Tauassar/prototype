import 'package:flutter/material.dart';
import 'login.dart';
import 'profile.dart';
import 'history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage('Tribore','Resistance'),
//      initialRoute: '/login',
//      routes: {
//        '/login':(context) => LoginPage(),
//
//      },
    );
  }
}
