import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:withyou/Shared/loadingToMain.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _password;

  void _submitCommand() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _loginCommand();
    }
  }

  void _loginCommand() {
    // This is just a demo, so no actual login here.
    final snackbar = SnackBar(
      content: Text('Welcome to our app'),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
    loadMainPage(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,height: 800,width: 1334,allowFontScaling: false);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:120.0,left: 40,right: 40),
          child: Column(
            children: <Widget>[
              Text('WithYou',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(280),
              ),
              ),
              SizedBox(height: 50,),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      validator: (val) => !EmailValidator.validate(val, true)
                          ? 'Not a valid email.'
                          : null,
                      onSaved: (val) => _email = val,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      validator: (val) =>
                          val.length < 4 ? 'Password too short..' : null,
                      onSaved: (val) => _password = val,
                      obscureText: true,
                    ),
                    SizedBox(height: 40,),
                    Container(
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 10.0,
                        child: GestureDetector(
                      onTap:_submitCommand,
                      child: Center(
                        child: Text('LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}