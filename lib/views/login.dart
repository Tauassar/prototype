import 'package:flutter/material.dart';
import '../widgets/Navigation.dart';
import '../service/auth_service.dart';
import '../widgets/provider_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controlEmail = TextEditingController();
  final controlPass = TextEditingController();
  bool _obscureText = true;
  IconData _lock = Icons.lock;
  String _email, _password, _error;


  void submit() async {
    if (validate()) {
      try {
        final auth = Provider
            .of(context)
            .auth;
        String uid = await auth.signInWithEmailAndPassword(_email, _password);
        print("Signed In with ID $uid");
        Navigator.of(context).pushReplacementNamed('/home');
      } catch (e) {
        print(e);
        setState(() {
          _error = e.message;
        });
      }
    }
  }

  Widget confirmButton(BuildContext context) {
    return RaisedButton(
      color: Colors.redAccent[700],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        _email = controlEmail.text;
        _password = controlPass.text;
        submit();
      },
      child: Center(
        child: Text('Войти',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[100],
          ),
        ),
      ),
    );
  }


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

  Widget mainTitle(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: RichText(
            text: TextSpan(
              text: 'Prototype\n',
              style: TextStyle(fontSize: 58,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent[700]),
              children: <TextSpan>[
                TextSpan(
                    text: 'Version',
                    style: TextStyle(height: 0.8,
                        fontSize: 58,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget showAlert() {
    if (_error != null) {
      return Container(
        height: 10,
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _error,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    else{
      return Container();
    }
  }


    Widget textFields(BuildContext context) {
      return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: controlEmail,
                validator: (value) {
                  return EmailValidator.validate(value);
                },
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'email',
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                    )
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: controlPass,
                obscureText: _obscureText,
                validator: PasswordValidator.validate,
                decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon(_lock), onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                        _lock = _obscureText ? Icons.lock : Icons.lock_open;
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
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25), BlendMode.dstATop),
                image: AssetImage('assets/img/bg1.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    height: _height*0.1,
                    child: showAlert()),
              SizedBox(
                height: _height*0.1),
                mainTitle(context),
                textFields(context),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment(0.7, 0.0),
                  child: Text('Забыли пароль?',
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 17,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: 200,
                  height: 50,
                  child: confirmButton(context),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
