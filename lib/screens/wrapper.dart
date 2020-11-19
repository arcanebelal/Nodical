import 'package:flutter/material.dart';
import 'package:nodical/models/nodical_user.dart';
import 'package:nodical/screens/home_screen.dart';
import 'package:nodical/services/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<NodicalUser>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
