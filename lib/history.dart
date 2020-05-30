import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  <Widget>[
              Container(
                color: Colors.grey[100],

                height: 100,
                padding: EdgeInsets.fromLTRB(20,40,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  <Widget>[
                    Text('История покупок ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.redAccent[700],
                        fontWeight: FontWeight.bold
                      ),),
                    Icon(Icons.credit_card,
                    color: Colors.redAccent[700],
                    size: 40,),
                ],),
              ),
            ]
        ),
    );
  }
}
