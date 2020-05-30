import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex=1;
  void Selection(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          title: Text('Карты'),
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
      selectedItemColor: Colors.redAccent,
      currentIndex: _currentIndex,
      onTap: Selection,
    );
  }
}
