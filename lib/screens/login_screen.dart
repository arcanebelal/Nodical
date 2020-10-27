import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nodical/screens/sign_up_screen.dart';
import 'package:nodical/services/authentication_service.dart';
import '../home.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;
  LoginScreen({this.toggleView});

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(labelText: 'Password'),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),
              Row(
                children: [
                  RaisedButton(
                    onPressed: () async {
                      _formKey.currentState.save();
                      dynamic result = await _auth.signInEmail(
                          email: _email.trim(), password: _password.trim());
                      if (result == null) {
                        print('error signing in');
                      } else {
                        print('signed in');
                        print(result.uid);
                      }
                    },
                    child: Text('Sign in'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      widget.toggleView();
                    },
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
