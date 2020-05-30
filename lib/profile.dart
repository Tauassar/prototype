import 'package:flutter/material.dart';
import 'package:prototype/Navigation.dart';

class ProfilePage extends StatelessWidget {
  String name;
  String surname;
  ProfilePage(this.name, this.surname);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  <Widget>[
                  Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 15, 15),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/avatar.jpg'),
                    radius: 50,
                  ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  <Widget>[
                        Text('$name \n$surname ',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.grey[800],
                          ),
                        ),
                    ],),
                  IconButton(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      icon: Icon(Icons.settings), onPressed: null),
                  ],),
                ],),
              ),
        );
      bottomNavigationBar: Navbar();
  }
}
