import 'package:flutter/material.dart';
import 'file:///C:/Users/adtsc/AndroidStudioProjects/prototype/lib/widgets/Navigation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText=true;
  IconData _lock=Icons.lock;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.dstATop),
            image: AssetImage('assets/img/bg1.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'Prototype\n',
                          style: TextStyle(fontSize: 58, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: Colors.redAccent[700]),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'Войти',
                          style: TextStyle(fontSize: 90, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: Colors.black87  )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Логин',
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          )
                      ),
                    ),
                    SizedBox( height: 15),
                    TextField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(icon: Icon(_lock), onPressed: (){
                            setState(() {
                              _obscureText=!_obscureText;
                              _lock=_obscureText?Icons.lock:Icons.lock_open;
                            });
                          }),
                          border: UnderlineInputBorder(),
                          labelText: 'Пароль',
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          )
                      ),
                    ),
                    SizedBox( height: 30 ),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      child: Text('Забыли пароль?',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 17,
                            decoration: TextDecoration.underline
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox( height: 50),
              Container(
                width: 200,
                height: 50,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.redAccent[700],
                  color: Colors.redAccent[700],
                  elevation: 7,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>Navigation()),
                      );
                    },
                    child: Center(
                      child: Text('Войти',
                        style: TextStyle(
                          color: Colors.grey[100],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}