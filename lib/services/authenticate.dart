import 'package:flutter/material.dart';
import 'package:nodical/screens/login_screen.dart';
import 'package:nodical/screens/sign_up_screen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginScreen(toggleView: toggleView);
    } else {
      return SignUpScreen(toggleView: toggleView);
    }
  }
}
