import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Войти',
                      style: TextStyle(
                          fontSize: 80,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                      )
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
                shadowColor: Colors.redAccent,
                color: Colors.redAccent,
                elevation: 7,
                child: GestureDetector(
                  onTap: (){},
                  child: Center(
                    child: Text('Продолжить',
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
    );
  }
}