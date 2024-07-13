import 'package:flutter/material.dart';
import 'package:v1/screens/Subject_Select_Widget2.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(
          fontFamily: 'JalnanGothic'
      ),
      debugShowCheckedModeBanner: false,
      home: Subject_Select_Widget2(),
    ),
  );
}
