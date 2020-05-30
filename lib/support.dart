import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/Navigation.dart';

class SupportPage extends StatelessWidget {
  String name;
  String surname;
  double bonus;
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
              color: Colors.grey[100],

              height: 100,
              padding: EdgeInsets.fromLTRB(20,40,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  <Widget>[
                  Text('Поддержка',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.redAccent[700],
                        fontWeight: FontWeight.bold
                    ),),
                ],),
            ),
            SizedBox( height: 50),
            Center(
              child: Column(children:  <Widget>[
                SupportButton('Проблемы с товаром'),
                SupportButton('Не посчитали товар'),
                SupportButton('Карта магазинов'),
                SupportButton('Связаться с нами'),
              ],),
            ),
          ]
        ),
      ),
    );
  }
}


class SupportButton extends StatefulWidget {
  String filler;
  SupportButton(this.filler);
  @override
  _SupportButtonState createState() => _SupportButtonState(filler);
}

class _SupportButtonState extends State<SupportButton> {
  String filler;
  _SupportButtonState(this.filler);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: OutlineButton(
        highlightedBorderColor: Colors.redAccent,
            splashColor: Colors.redAccent,
            borderSide: BorderSide.none,
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  <Widget>[
                Expanded(
                  child: Text(filler,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                  ),),
                ),
                   Icon(Icons.arrow_forward_ios)
              ],),),
    );
  }
}


