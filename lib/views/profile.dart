import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/adtsc/AndroidStudioProjects/prototype/lib/widgets/CreditCard.dart';

class ProfilePage extends StatelessWidget {
  String name;
  String surname;
  double bonus;
  List<CreditCard> cardList=[
    CreditCard('4000 1234 5678 9001', 'Tribore Resistance','09/22', 302),
  ];
  ProfilePage(this.name, this.surname, this.bonus, this.cardList);
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
                  Container(

                    child: Row(
                      children:  <Widget>[ Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:  <Widget>[
                                  Padding(
                                  padding: EdgeInsets.fromLTRB(30, 30, 15, 15),
                                  child: CircleAvatar(
                                    radius: 44,
                                    backgroundColor: Colors.redAccent[700],
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage('assets/img/avatar.jpg'),
                                      radius: 40,

                                    ),
                                  ),
                                ),
                                  SizedBox( width: 10 ),
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
                  ),
                    Text('Bonuses: $bonus T'),
                ],),
              Container(
                margin: EdgeInsets.only(top:20, right: 20,left: 20),
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
                      ),
                      CardW(cardList),
                      ],
                ),
              )
            ],),
          ),
    );
  }
}
