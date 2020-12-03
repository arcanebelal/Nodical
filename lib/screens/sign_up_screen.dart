import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nodical/services/authentication_service.dart';
import '../home.dart';

class SignUpScreen extends StatefulWidget {
  final Function toggleView;
  SignUpScreen({this.toggleView});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthenticationService _firebaseAuth = AuthenticationService();
  String _email, _password, _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          'Registration',
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (input) => _name = input,
                obscureText: true,
              ),
              Row(
                children: [
                  RaisedButton(
                    onPressed: () async {
                      _formKey.currentState.save();
                      _firebaseAuth.signUpEmail(
                          email: _email.trim(),
                          password: _password.trim(),
                          name: _name.trim());
                    },
                    child: Text('Sign up'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      widget.toggleView();
                    },
                    child: Text('Sign in'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
