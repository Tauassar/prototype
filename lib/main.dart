import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views/login.dart';
import 'service/auth_service.dart';
import 'views/profile.dart';
import 'views/history.dart';
import 'views/addCard.dart';
import 'widgets/provider_widget.dart';
import 'widgets/Navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: "Prototype App",
//        home: Navigation(),
//        home: AddCard(),
        home: HomeController(),
        initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomeController(),
      },
      ),
    );
  }
}


class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Navigation() : LoginPage();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
