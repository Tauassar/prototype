import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prototype/views/addCard.dart';
import 'provider_widget.dart';

class CreditCard{
  String number;
  String name;
  String  valid;
  String code;

  CreditCard(this.number, this.name, this.valid, this.code);
}

class CardW extends StatelessWidget {


  Stream<QuerySnapshot> getUsersCardsStreamSnapshots(BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance.collection('UserData').document(uid).collection('cards').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 650,
      child: StreamBuilder(
        stream: getUsersCardsStreamSnapshots(context),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const Text("Loading...");
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index){
                  return buildCard(context: context, card: snapshot.data.documents[index]);
              }
          );
        }
      ),
    );
  }

}

class buildCard extends StatelessWidget {
  const buildCard({
    Key key,
    @required this.context,
    @required this.card,
  }) : super(key: key);

  final BuildContext context;
  final DocumentSnapshot card;

  @override
  Widget build(BuildContext context) {
//    final card = cardList[index];
    return Container(
      height: 240,
      width: 650,
      child: Card(
        color: Colors.grey[700],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 70.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Text(card['number'], style: new TextStyle(fontFamily: 'Inconsolata', fontSize: 26.0,fontWeight: FontWeight.bold, color: Colors.grey[200]),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 160, top: 10.0, bottom: 8.0, right: 10),
                child: Row(children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'GOOD\n',
                      style: TextStyle(fontSize: 8, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'THRU',
                            style: TextStyle(fontSize: 8, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: Colors.white  )),
                      ],
                    ),
                  ),
                  Text(
                      " ${card['THRU']}",
                      style: TextStyle(fontSize: 20, fontFamily: 'Inconsolata', fontWeight: FontWeight.bold, color: Colors.white  )),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8.0, left: 20, right: 27),
                child: Row(
                  children: <Widget>[
                    Text("${card['name']}", style: new TextStyle(fontFamily: 'Inconsolata', fontSize: 20.0,fontWeight: FontWeight.bold, color: Colors.white),),
                    Spacer(),
                    Icon(Icons.credit_card,
                      color: Colors.grey[200],),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}