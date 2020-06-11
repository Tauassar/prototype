import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'addCard.dart';
import 'PlainText.dart';

class CreditCard{
  final String number;
  final String name;
  final String  valid;
  final code;

  CreditCard(this.number, this.name, this.valid, this.code);

}

class CardW extends StatelessWidget {
  List<CreditCard> cardList=[];
  CardW(this.cardList);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      Container(
        height: 240,
        width: 650,
        child: ListView.builder(
            itemCount: cardList.length,
            itemBuilder: (BuildContext context, int index)=>buildCard(context, index)
        ),
      ),

    ],);
  }

  Widget buildCard(BuildContext context, int index) {
    final card = cardList[index];
    return Container(
      height: 240,
      width: 650,
      child: GestureDetector(
        onTap: (){
        },
        child: Card(
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
      ),
    );
  }
}


