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
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Container(
              height: 100,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,20,10,0),
                child: Text('Поддержка',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 60),),
              ),
            ),
            SupportButton('Проблемы с товаром'),
            SupportButton('Не посчитали товар'),
            SupportButton('Карта магазинов'),
            SupportButton('Связаться с нами'),

          ]
        ),
      ),
      bottomNavigationBar: Navbar(),
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


