import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:v1/screens/Subject_Select_Widget1.dart';
import 'package:v1/screens/Subject_Select_Widget2.dart';
import 'package:v1/screens/Option_Page_Widget.dart';

class First_Select_Widget extends StatefulWidget {
  const First_Select_Widget({super.key});

  @override
  State<First_Select_Widget> createState() => _First_Select_WidgetState();
}

class _First_Select_WidgetState extends State<First_Select_Widget> {
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
        leading:
          IconButton(
            onPressed: () {
              _authentication.signOut();
            },
            icon: Icon(
              Icons.exit_to_app_sharp,
              color: Colors.black,
            ),
            iconSize: 50,
          ),
        actions: [
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Option_Page_Widget())), icon: Icon(Icons.settings,size: 40,))
        ],
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
                          builder: (context) => Subject_Select_Widget1(),
                        ),
                      );
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
                              "비정기적",
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
                          builder: (context) => Subject_Select_Widget2(),
                        ),
                      );
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
                              "정기적",
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
