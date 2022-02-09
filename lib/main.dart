import 'package:app/Screens/Splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
//Color theme
          primaryColor: Colors.redAccent,
          primaryColorLight: Colors.white,
          primaryColorDark: Colors.black,
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.white,
          dividerColor: Color(0xFF202020),
          hintColor: Colors.white,
          // focusColor: Colors.black,
          // hoverColor: Colors.black,

//Button theme

          buttonTheme: ButtonThemeData(
              buttonColor: Theme.of(context).primaryColor,
              splashColor: Colors.red),

//Text theme

          textTheme: TextTheme(
              button: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70),
              bodyText1: TextStyle(fontSize: 20, color: Colors.white70),
              subtitle2: TextStyle(fontSize: 20, color: Colors.white38)),
        ),
        home: Splash_screen());
  }
}
