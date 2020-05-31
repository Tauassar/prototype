import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlainText extends StatelessWidget {
  String title;
  String text;
  PlainText(this.title, this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  <Widget>[
              Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(0,40,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  <Widget>[
                    Flexible(
                      child: Text(title,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ],),
              ),
              SizedBox( height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 480,
                    child: ListView(
                      children:  <Widget>[
                      Text(text,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey[800],
                        ),
                      ),
                    ],),
                ),
              ),
            ]
        ),
      ),
    );
  }
}


