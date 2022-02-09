import 'package:app/Screens/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  _Login_screenState createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
//Controller

  TextEditingController Email_controller = TextEditingController();
  TextEditingController Password_controller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

// Login Function

  Future login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: Email_controller.text, password: Password_controller.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //sign up Function

  Future sign_Up() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: Email_controller.text, password: Password_controller.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home_screen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: ListView(shrinkWrap: true, children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.14),

//logo

              Center(
                  child: Image.asset(
                "assets/logo.png",
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
                color: Theme.of(context).primaryColor,
              )),

//Email

              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.1,
                    MediaQuery.of(context).size.height * 0.05,
                    MediaQuery.of(context).size.width * 0.1,
                    MediaQuery.of(context).size.height * 0.00),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).dividerColor),

                // ignore: prefer_const_constructors
                child: TextField(
                  controller: Email_controller,
                  style: Theme.of(context).textTheme.bodyText1,
                  cursorColor: Theme.of(context).primaryColor,
                  cursorWidth: 3,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColor,
                    // hoverColor: Colors.black,
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: Theme.of(context).textTheme.subtitle2,
                    contentPadding: EdgeInsets.fromLTRB(25, 1, 3, 1),
                  ),
                ),
              ),

//Password

              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.1,
                    MediaQuery.of(context).size.height * 0.05,
                    MediaQuery.of(context).size.width * 0.1,
                    MediaQuery.of(context).size.height * 0.05),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).dividerColor),

                // ignore: prefer_const_constructors
                child: TextField(
                  controller: Password_controller,
                  style: Theme.of(context).textTheme.bodyText1,
                  cursorColor: Theme.of(context).primaryColor,
                  cursorWidth: 3,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColor,
                    // hoverColor: Colors.black,
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: Theme.of(context).textTheme.subtitle2,
                    contentPadding: EdgeInsets.fromLTRB(25, 1, 3, 1),
                  ),
                ),
              ),

//Login Button

              Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.1,
                      MediaQuery.of(context).size.height * 0.05,
                      MediaQuery.of(context).size.width * 0.1,
                      MediaQuery.of(context).size.height * 0.00),
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).primaryColor),
                  child: TextButton(
                      onPressed: () {
                        sign_Up();
                        Email_controller.clear();
                        Password_controller.clear();
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.button,
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))))),
            ],
          )
        ]));
  }
}
