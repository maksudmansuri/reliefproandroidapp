import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'styles/svgIcon.dart';
import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans"
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
      //Scaffold(
       // resizeToAvoidBottomInset: false,
        //body: Container(
         // child: LoginPage(),
        //),
     // ),
    );
  }
}


