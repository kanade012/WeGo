
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v1/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:v1/screens/First_Select_Widget1.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return First_Select_Widget();
          }
          return LoginSignupScreen();
        },
      ),
    ),
  );
}
