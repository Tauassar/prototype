import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views/login.dart';
import 'views/profile.dart';
import 'views/history.dart';
import 'views/support.dart';
import 'file:///C:/Users/adtsc/AndroidStudioProjects/prototype/lib/widgets/Navigation.dart';
import 'file:///C:/Users/adtsc/AndroidStudioProjects/prototype/lib/widgets/CreditCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: Navigation(),
//      home: ProfilePage('Tribore','Resistance', 320, cardList),
      home: LoginPage(),
//      initialRoute: '/login',
//      routes: {
//        '/login':(context) => LoginPage(),
//      },
    );
  }
}
