import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/widgets/CreditCard.dart';
import 'package:prototype/widgets/provider_widget.dart';
import 'package:prototype/views/addCard.dart';
import 'package:prototype/service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prototype/widgets/provider_widget.dart';



class ProfilePage extends StatelessWidget {
  String name;
  String surname;
  String avatarURL;
  String bonus;

  Stream<DocumentSnapshot> getUserDataStreamSnapshots(BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance.collection('UserData').document(uid).snapshots();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: getUserDataStreamSnapshots(context),
                builder: (context, snapshot) {
                  Map<String, dynamic> dataPersonal = snapshot.data.data;
                  name=dataPersonal['name'];
                  surname=dataPersonal['surname'];
                  avatarURL=dataPersonal['avatarURL'];
                  bonus=dataPersonal['bonus'];
//                  if(!snapshot.hasData) return const Text("Loading...");
                  return Column(
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
//                                      backgroundImage: AssetImage('assets/img/avatar.jpg'),
                                        backgroundImage: NetworkImage(dataPersonal['avatarURL']),
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
                                          onPressed: () async {
                                            try {
                                              AuthService auth = Provider.of(context).auth;
                                              await auth.signOut();
                                              print("Signed Out!");
                                            } catch (e) {
                                              print (e);
                                            }
                                          },
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          icon: Icon(Icons.settings)),
                                      ],),
                              ],),
                      ),
                        Text('Bonuses: $bonus T'),
                    ],);
                }
              ),
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
                      CardW(),
                      SizedBox( height: 15 ),
                      RaisedButton(
                        color: Colors.redAccent[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>AddCard()),
                          );},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Добавить карту',
                              style: TextStyle(fontSize: 25, color: Colors.grey[100],),),
                            Icon(Icons.add_circle_outline,
                              size: 30,
                              color: Colors.grey[100],),
                          ],
                        ),
                      )
                      ],
                ),
              )
            ],),
          ),
    );
  }
}
