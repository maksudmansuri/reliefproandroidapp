import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'styles/svgIcon.dart';

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
      home: Scaffold(
        body: Container(
          child: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;

  var _backgorundColor = Colors.white;
  var _headingColor = Color(0xFF006D95);

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;

  double _loginWidth = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  double _loginOpacity = 1;

  double _headingTop = 100;

  @override
  Widget build(BuildContext context) {

    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    switch(_pageState){
      case 0:
        _backgorundColor = Colors.white;
        _headingColor = Color(0xFF006D95);
        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 100;
        break;
      case 1:
        _backgorundColor = Color(0xFF006D95);
        _headingColor = Colors.white;
        _loginYOffset = 230;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 90;
        break;
      case 2:
        _backgorundColor = Color(0xFF006D95);
        _headingColor = Colors.white;
        _loginYOffset = 180;
        _registerYOffset = 200;
        _loginXOffset = 20;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _headingTop = 50;
        break;
    }

    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000
          ),

          color: _backgorundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Container(
                  child:Column(
                    children: [
                      AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(
                          milliseconds: 1000,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 2
                        ),
                        margin: EdgeInsets.only(top: _headingTop,),
                        child: Text("Book A Appointment",
                          style: TextStyle(
                            color: _headingColor,
                            fontSize: 25,
                          ),)
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text("Hospital, labs, Pharmacy book your appoinment to get services",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:_headingColor,
                            fontSize: 16,
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Center(
                  child: SvgPicture.asset(iconLogin,height: 180.0),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_pageState != 0){
                      _pageState = 0;
                      }else{
                        _pageState = 1;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(32),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF006D95),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              _pageState = 2;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _loginWidth,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000,
            ),
            transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Login To Continue",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                    InputWithIcon(),
                    SizedBox(height: 20),
                  ],
                ),
                Column(
                  children: [
                    PrimaryButton(
                        btnText: "Login",
                    ),
                    //SizedBox( height: 20,),
                    //OutlineButton(btnText: "Create New Account")
                  ],
                ),
              ],
            ),

          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              _pageState =1;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000,
            ),
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Create a New Account",
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                        ),
                      ],
                    ),
                    PrimaryButton(
                      btnText: "Create Account",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OutlineButton(btnText: "Back To Login")
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class InputWithIcon extends StatefulWidget {
  const InputWithIcon({Key? key}) : super(key: key);

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF006D95),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: [
          Container(
            width: 60 ,
            child: Icon(
              Icons.phone,
              size: 20,
              color: Color(0xFFBB989B9),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: "Enter Mobile number"
              ),
            ),

          ),
        ],
      ),
    );
  }
}


class PrimaryButton extends StatefulWidget {
  final String btnText;

  const PrimaryButton({Key? key, required this.btnText}) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF006D95),
        borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
        widget.btnText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16
        ),)
      ),
    );
  }
}


class OutlineButton extends StatefulWidget {
  final String btnText;
  const OutlineButton({Key? key, required this.btnText}) : super(key: key);

  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF006D95),
          width: 2,
        ),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
          child: Text(
            widget.btnText,
            style: TextStyle(
                color: Color(0xFF006D95),
                fontSize: 16
            ),)
      ),
    );
  }
}


