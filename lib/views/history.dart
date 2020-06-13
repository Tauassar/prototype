import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/widgets/history_widget.dart';
import 'package:prototype/widgets/provider_widget.dart';
import 'dart:math';


class HistoryPage extends StatelessWidget {

  final db=Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  <Widget>[
              Container(
                color: Colors.grey[100],
                height: 150,
                padding: EdgeInsets.fromLTRB(20,40,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  <Widget>[
                    Text('История\n покупок ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.redAccent[700],
                        fontWeight: FontWeight.bold
                      ),),
                    GestureDetector(
                      onTap: ()async{
                        final uid = await Provider.of(context).auth.getCurrentUID();
                        Random rand=Random();
                        double a=rand.nextInt(45000).toDouble()+5000;
                        double percent=a/100;
                        await db.collection('UserData').document(uid).collection('history').add({
                          'cashback': percent.toString(),
                          'date': DateTime.now(),
                          'sum': a.toString(),
                        });
                      },
                      child: Icon(Icons.credit_card,
                      color: Colors.redAccent[700],
                      size: 40,),
                    ),
                ],),
              ),
              Container(
                  child: historyWidget())
            ]
        ),
    );
  }
}
