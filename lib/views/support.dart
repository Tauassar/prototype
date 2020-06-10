import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/PlainText.dart';

class SupportPage extends StatelessWidget {
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
  String sample='Most public transport systems run along fixed routes with set embarkation/disembarkation points to a prearranged timetable, with the most frequent services running to a headway (e.g.: "every 15 minutes" as opposed to being scheduled for any specific time of the day). However, most public transport trips include other modes of travel, such as passengers walking or catching bus services to access train stations.[4] Share taxis offer on-demand services in many parts of the world, which may compete with fixed public transport lines, or complement them, by bringing passengers to interchanges. Paratransit is sometimes used in areas of low demand and for people who need a door-to-door service';
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
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>PlainText(filler, 'Sample Text: $sample')),
              );
            },
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


