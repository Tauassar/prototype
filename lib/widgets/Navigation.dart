import 'package:flutter/material.dart';
import '../views/profile.dart';
import '../views/history.dart';
import '../views/support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'CreditCard.dart';


class Navigation extends StatefulWidget {

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
    int _currentIndex=1;

    final List<Widget> _children=[
      HistoryPage(),
      ProfilePage(),
      SupportPage(),
    ];
    void Selection(int index){
      setState(() {
        _currentIndex=index;
      });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Text('История'),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Профиль'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text('Поддержка'),
          ),
        ],
        backgroundColor: Colors.grey[500],
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 40),
        unselectedItemColor: Colors.grey[100],
        unselectedIconTheme: IconThemeData(size: 25),
        currentIndex: _currentIndex,
        onTap: Selection,
      ),
    );
  }
  }

