import 'package:flutter/material.dart';
import 'CreditCard.dart';



class AddCard extends StatefulWidget {

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final card=CreditCard('4000 1234 5678 9001', 'Tribore Resistance','09/22', 302);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.grey[700],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 70.0, bottom: 4.0),
                      child: Row(children: <Widget>[
                        Text(card.number, style: new TextStyle(fontFamily: 'Inconsolata', fontSize: 26.0,fontWeight: FontWeight.bold, color: Colors.grey[200]),),
                        Spacer(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 180, top: 10.0, bottom: 8.0, right: 10),
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
                            " ${card.valid}",
                            style: TextStyle(fontSize: 20, fontFamily: 'Inconsolata', fontWeight: FontWeight.bold, color: Colors.white  )),
                        Spacer(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 8.0, left: 20, right: 27),
                      child: Row(
                        children: <Widget>[
                          Text("${card.name}", style: new TextStyle(fontFamily: 'Inconsolata', fontSize: 20.0,fontWeight: FontWeight.bold, color: Colors.white),),
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

          ],
        ),
      ),

    );
  }
}
