import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:v1/screens/subjects/1/Subject_Game1_Widget.dart';
import 'subjects/1/Subject_Sports1_Widget.dart';
import 'subjects/1/Subject_Study1_Widget.dart';
import 'subjects/1/Subject_Play1_Widget.dart';
import 'subjects/1/Subject_Etc1_Widget.dart';

class Subject_Select_Widget1 extends StatefulWidget {
  const Subject_Select_Widget1({super.key});

  @override
  State<Subject_Select_Widget1> createState() => _Subject_Select_Widget1State();
}

class _Subject_Select_Widget1State extends State<Subject_Select_Widget1> {
  final _authentication = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/Asset_3.svg',
          ),
          SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 90,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Subject_Game1_Widget()));
                    },
                    child: Container(
                      height: 253,
                      width: 253,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff2debc9),
                            Color(0xff17a6b8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "게임",
                              style: TextStyle(
                                fontFamily: 'JalnanGothic',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Subject_Sports1_Widget()));
                    },
                    child: Container(
                      height: 253,
                      width: 253,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff2debc9),
                            Color(0xff17a6b8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "스포츠",
                              style: TextStyle(
                                  fontFamily: 'JalnanGothic',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Subject_Study1_Widget()));
                    },
                    child: Container(
                      height: 253,
                      width: 253,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff2debc9),
                            Color(0xff17a6b8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "스터디",
                              style: TextStyle(
                                  fontFamily: 'JalnanGothic',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Subject_Play1_Widget()));
                    },
                    child: Container(
                      height: 253,
                      width: 253,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff2debc9),
                            Color(0xff17a6b8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "여가",
                              style: TextStyle(
                                  fontFamily: 'JalnanGothic',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Subject_Etc1_Widget()));
                    },
                    child: Container(
                      height: 253,
                      width: 253,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff2debc9),
                            Color(0xff17a6b8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "기타",
                              style: TextStyle(
                                  fontFamily: 'JalnanGothic',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            '/Users/youngha/AndroidStudioProjects/v1/assets/images/WeGoImage.jpeg',
            width: 500,
            height: 432,
            fit: BoxFit.fitWidth,
          )
        ],
      ),
    );
  }
}
