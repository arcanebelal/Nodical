import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nodical/models/nodical_user.dart';
import 'package:nodical/screens/wrapper.dart';
import 'package:nodical/services/authentication_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<NodicalUser>.value(
          value: AuthenticationService().user,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale('en', 'US'),
        supportedLocales: [
          const Locale('en', 'US'), // English
        ],
        home: Wrapper(),
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.green,
          accentColor: Color(0xFFE8FFE6),
        ),
      ),
    );
  }
}
