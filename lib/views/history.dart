import 'package:auto_size_text/auto_size_text.dart';
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
                height: 90,
                padding: EdgeInsets.fromLTRB(20,20,0,20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  <Widget>[
                    AutoSizeText('История покупок ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.redAccent[700],
                        fontWeight: FontWeight.bold
                      ),),
                    Icon(Icons.credit_card,
                    color: Colors.redAccent[700],
                    size: 40,),
                ],),
              ),
              Container(
                  child: historyWidget())
            ]
        ),
    );
  }
}
