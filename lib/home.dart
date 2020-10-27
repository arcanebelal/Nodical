import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:nodical/models/nodical_user.dart';
import 'package:nodical/screens/chat_home_screen.dart';
import 'package:nodical/screens/login_screen.dart';
import 'package:nodical/screens/sign_up_screen.dart';
import 'package:nodical/services/authentication_service.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final NodicalUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime dateTime;
  Duration duration;
  final AuthenticationService _firebaseAuth = AuthenticationService();

  @override
  void initState() {
    dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBody() {
      return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Date Time selected",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "$dateTime",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 50),
              children: <Widget>[
                const SizedBox(height: 12),
                FloatingActionButton.extended(
                  onPressed: () async {
                    DateTime newDateTime = await showRoundedDatePicker(
                      context: context,
                      theme: ThemeData(primarySwatch: Colors.green),
                      textNegativeButton: "CANCEL",
                      textPositiveButton: "OK",
                      textActionButton: "TODAY",
                      onTapActionButton: () {
                        Navigator.of(context).pop(DateTime.now());
                      },
                    );
                    if (newDateTime != null) {
                      setState(() => dateTime = newDateTime);
                    }
                  },
                  label: const Text("Nodical Calendar"),
                ),
                FloatingActionButton.extended(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreenState()),
                    );
                  },
                  label: const Text("Nodical Chat"),
                  heroTag: null,
                ),
                FloatingActionButton.extended(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  label: const Text("Login Screen"),
                  heroTag: null,
                ),
                FloatingActionButton.extended(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  label: const Text("Sign Up Screen"),
                  heroTag: null,
                ),
                FloatingActionButton.extended(
                  onPressed: () async {
                    await _firebaseAuth.signOut();
                  },
                  label: const Text("Sign Out"),
                  heroTag: null,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: widget.user != null
            ? Text('Nodical ${widget.user.uid}')
            : Text('Nodical'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: _buildBody(),
      ),
    );
  }
}
