import 'package:flutter/material.dart';
import 'package:prototype/widgets/provider_widget.dart';
import '../widgets/CreditCard.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../service/auth_service.dart';

class AddCard extends StatefulWidget {

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final db=Firestore.instance;

  static String number, name, valid, cvc;
  CreditCard card=CreditCard(number, name, valid, cvc);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controlNumber = TextEditingController();
  final controlName = TextEditingController();
  final controlMM = TextEditingController();
  final controlYY = TextEditingController();
  final controlCVC = TextEditingController();

  bool validate() {
    final form = _formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }


  Widget AddButton(BuildContext context) {
    return Container(
      width: 200,
      child: RaisedButton(
        color: Colors.redAccent[700],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
        onPressed: () async{

          if (validate()) {
            try {
              final uid = await Provider.of(context).auth.getCurrentUID();
              await db.collection('UserData').document(uid).collection('cards').add({
                'number': controlNumber.text,
                'name': controlName.text,
                'THRU': controlMM.text+" / "+controlYY.text,
                'CVC': controlCVC.text,
              });
              Navigator.of(context).pop();
            } catch (e) {
              print(e);
            }
          }
          else {
            print('\n\n\n\n\n\n\nERROR\n\n\n\n\n\n');
          }
        },
        child: Center(
          child: Text('Добавить карту',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[100],
            ),
          ),
        ),
      ),
    );
  }


  Widget textFields(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly],

              onChanged: (value){
                setState(() => number=controlNumber.text);},
              keyboardType: TextInputType.number,
              controller: controlNumber,
              validator: NumberValidator.validate,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Номер карты',
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                  )
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: controlName,
              onChanged: (value){
                setState(() => name=controlName.text);},
              validator: NameValidator.validate,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Имя владельца',
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                  )
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Container(
                  width: 40,
                  child: TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,

                    onChanged: (value){
                      setState(() => number=controlMM.text);},

                    controller: controlMM,
                    validator: MMValidator.validate,
                    decoration: InputDecoration(

                        border: UnderlineInputBorder(),
                        labelText: 'MM',
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                        )
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text('\n/',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 25,
                  ),),
                SizedBox(width: 5),
                Container(
                  width: 40,
                  child: TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,

                    onChanged: (value){
                      setState(() => number=controlYY.text);},

                    controller: controlYY,
                    validator: YYValidator.validate,
                    decoration: InputDecoration(

                        border: UnderlineInputBorder(),
                        labelText: 'YY',
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,

                        )
                    ),
                  ),
                ),
                SizedBox(width: _width*0.4),
                Container(
                  width: 60,
                  child: TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,

                    onChanged: (value){
                      setState(() => cvc=controlCVC.text);},

                    controller: controlCVC,
                    validator: CVCValidator.validate,
                    decoration: InputDecoration(

                        border: UnderlineInputBorder(),
                        labelText: 'CVC',
                        labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,

                        )
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 250,
                  width: 650,
                  child: AddCardForm(card: card, context: context, controlCVC: controlCVC, controlMM: controlMM, controlName: controlName, controlNumber: controlNumber, controlYY: controlYY,)),
//                  child: buildCard(card: card, context: context,)),
              textFields(context),

              SizedBox(
                height: _height*0.07,
              ),

              AddButton(context),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Отмена",
                ),
              )
            ],

          ),
        ),
      ),

    );
  }
}


class NumberValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Это поле нельзя оставлять пустым";
    }
    if(value.length<16) {
      return "Номер слишком короткий";
    }
    return null;
  }
}
class NameValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Это поле нельзя оставлять пустым";
    }
    return null;
  }
}

class CVCValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Это поле нельзя оставлять пустым";
    }
    if(value.length < 3) {
      return "CVC должен содердать не менее 3 символов";
    }
    if(value.length > 3) {
      return "Слишком много символов для CVC";
    }
    return null;
  }
}

class MMValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Это поле нельзя оставлять пустым";
    }
    if(value.length > 2) {
      return "Слишком много символов";
    }
    if(value.length > 2) {
      return "Слишком много символов";
    }
    return null;
  }
}
class YYValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Это поле нельзя оставлять пустым";
    }
    if(value.length > 2) {
      return "Слишком много символов";
    }
    if(value.length > 2) {
      return "Слишком много символов";
    }
    return null;
  }
}

class AddCardForm extends StatelessWidget {
  const AddCardForm({
    Key key,
    @required this.context,
    @required this.card, this.controlNumber, this.controlName, this.controlMM, this.controlYY, this.controlCVC,

  }) : super(key: key);

  final TextEditingController controlNumber;
  final TextEditingController controlName;
  final TextEditingController controlMM;
  final TextEditingController controlYY;
  final TextEditingController controlCVC;

  final BuildContext context;
  final CreditCard card;

  Widget Formfield(double width, TextEditingController control, String text, TextStyle style){
    return Container(
      width: width,
      child: TextFormField(
          textAlign: TextAlign.center,
          enableInteractiveSelection: false, // will disable paste operation
          focusNode: new AlwaysDisabledFocusNode(),
        controller: control,
        decoration: InputDecoration(
          labelText:text,

          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
//    final card = cardList[index];
    return Card(
      color: Colors.grey[700],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
//            color: Colors.blue,
            padding: const EdgeInsets.only(left: 20, top: 50.0),
            height: 100,
            child: Row(children: <Widget>[
              Formfield(280, controlNumber, 'Номер Карты',TextStyle(fontFamily: 'Inconsolata', fontSize: 26.0,fontWeight: FontWeight.bold, color: Colors.grey[200])),
            ]),
          ),
          Container(
//            color: Colors.amber,
            padding: const EdgeInsets.only(left: 180, top: 0.0, bottom: 0.0, right: 10),
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
              SizedBox(
                width: 10,
              ),
              Formfield(30, controlMM, 'ММ',TextStyle(fontSize: 20, fontFamily: 'Inconsolata', fontWeight: FontWeight.bold, color: Colors.white  )),
              Text('/'),
              Formfield(30, controlYY, 'YY',TextStyle(fontSize: 20, fontFamily: 'Inconsolata', fontWeight: FontWeight.bold, color: Colors.white  )),
////                  Text(
//                      " ${card.valid}",
//                      style: TextStyle(fontSize: 20, fontFamily: 'Inconsolata', fontWeight: FontWeight.bold, color: Colors.white  )),
//                  Spacer(),
            ]),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5.0, bottom: 0.0, left: 25, right: 27),
            child: Row(
              children: <Widget>[
                Formfield(200 ,controlName, 'Имя клиента',TextStyle(fontFamily: 'Inconsolata', fontSize: 20.0,fontWeight: FontWeight.bold, color: Colors.white)),
//                    Text("${card.name}", style: new TextStyle(fontFamily: 'Inconsolata', fontSize: 20.0,fontWeight: FontWeight.bold, color: Colors.white),),
                Spacer(),
                Icon(Icons.credit_card,
                  color: Colors.grey[200],),
              ],
            ),
          )
        ],
      ),
    );
  }
}