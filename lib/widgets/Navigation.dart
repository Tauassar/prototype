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
  static List<CreditCard> cardList=[
    CreditCard('4000 1234 5678 9031', 'Tribor Resistance','09/22', '302'),
    CreditCard('4000 1234 5678 9011', 'Tribore Resistance','09/22', '302'),
    CreditCard('4000 1234 5678 9111', 'Triboree Resistance','09/22', '302'),
    CreditCard('4000 1234 5678 1111', 'Triboreee Resistance','09/22', '302'),
  ];
    int _currentIndex=1;

    //_NavigationState(this.cardList);

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

