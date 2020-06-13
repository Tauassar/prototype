import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'provider_widget.dart';
import 'package:intl/intl.dart';

class historyWidget extends StatelessWidget {

  Stream<QuerySnapshot> getUsersHistoryStreamSnapshots(BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance.collection('UserData').document(uid).collection('history').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Container(
      height: _height-48-150-46,
      width: _width,
      child: StreamBuilder(
          stream: getUsersHistoryStreamSnapshots(context),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return const Text("Loading...");
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index){
                  return historyTile(context: context, tile: snapshot.data.documents[index], width: _width);
                }
            );
          }
      ),
    );
  }

}

class historyTile extends StatelessWidget {
  const historyTile({
    Key key,
    @required this.context,
    @required this.tile,
    @required this.width,
  }) : super(key: key);

  final double width;
  final BuildContext context;
  final DocumentSnapshot tile;

  BoxDecoration TileBoxDecoration() {
    return BoxDecoration(
      color: Colors.amber,
      border: Border(
        top: BorderSide(
          color: Colors.grey[300],
          width: 1.5,
        ),
        bottom: BorderSide(
          color: Colors.grey[300],
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color textColor=Colors.grey[100];

    return Container(
      height: 85,
      width: width,
      decoration: TileBoxDecoration(),
      child: Row(
        children: [
          SizedBox(width: width*0.06,),
          Icon(Icons.shopping_cart,
          color: textColor,
          size: 40,),
          SizedBox(width: width*0.06,),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText("${DateFormat('dd/MM/yy').format(tile['date'].toDate()).toString()}",
                maxLines: 2,
                minFontSize: 25,
                style: TextStyle(
                  fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: textColor
                  ),),
              AutoSizeText("${DateFormat('Hm').format(tile['date'].toDate()).toString()}",
                textAlign: TextAlign.right,
                maxLines: 2,
                minFontSize: 10,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: textColor
                ),),
            ],
          ),
          Spacer(flex: 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText("${tile['sum']} T",
                maxLines: 1,
                minFontSize: 25,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: textColor
                ),),
              AutoSizeText("+${tile['cashback']} T",
                textAlign: TextAlign.right,
                maxLines: 1,
                minFontSize: 10,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: Colors.green
                ),),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
