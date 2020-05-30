import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/Navigation.dart';

class ProfilePage extends StatelessWidget {
  String name;
  String surname;
  double bonus;
  ProfilePage(this.name, this.surname, this.bonus);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children:  <Widget>[ Row(
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
                                          fontWeight: FontWeight.bold,
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
                    Text('Bonuses: $bonus T'),
                ],),
              Container(
                height: 300,
                margin: EdgeInsets.all(20),
                child: Column(
                    children:  <Widget>[
                      SizedBox( height: 15),
                        Align(
                          alignment: Alignment.center,
                          child: Text('Bank accounts',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 3,
                        endIndent: 0,
                      )
                      ],
                ),
              )
            ],),
          ),
      bottomNavigationBar: Navbar(),
    );
  }
}
