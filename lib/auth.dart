import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'styles/svgIcon.dart';
import 'splash.dart';

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
  double _loginHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;
  double _registerHeight = 0;

  double _loginOpacity = 1;

  double _headingTop = 100;

  bool _keyboardVisible = false;

  void initState(){
    super.initState();

    KeyboardVisibilityController().onChange.listen((isVisible) {
      setState(() {
        _keyboardVisible = isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {


    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

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
        _loginYOffset = _keyboardVisible ? 28 : 550;
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
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: _loginWidth,
          height: _loginHeight,
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
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  InputWithIcon(
                    icon: Icons.phone,
                    hint: "Mobile Number",
                  ),
                  if(_keyboardVisible)SizedBox(

                    //width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              child: Icon(
                                Icons.contact_support,
                                size: 16,
                                color: Color(0xFFBB989B9),
                              ),
                            ),
                            Container(
                              child: Text(
                                "SingIn with Password",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),height: 250
                  ),
                  if(_keyboardVisible == false)SizedBox(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              child: Icon(
                                Icons.contact_support,
                                size: 16,
                                color: Color(0xFFBB989B9),
                              ),
                            ),
                            Container(
                              child: Text(
                                "SingIn with Password",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      height: 20
                  ),

                ],
              ),
              Column(
                children: [
                  PrimaryButton(
                    btnText: "Send OTP",
                  ),
                  //SizedBox( height: 20,),
                  //OutlineButton(btnText: "Create New Account")
                ],
              ),
            ],
          ),

        ),
        AnimatedContainer(
          height: _registerHeight,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      InputWithIcon(
                        icon: Icons.phone,
                        hint: "OTP",
                      ),
                      SizedBox(height: 20),
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
      ],
    );
  }
}

class TextLink extends StatefulWidget {
  final IconData icon;
  final String text;

  const TextLink({Key? key, required this.icon,required this.text}) : super(key: key);

  @override
  _TextLinkState createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),

      child: Row(
        children: [
          Container(
            width: 60 ,
            child: Icon(
              widget.icon,
              size: 16,
              color: Color(0xFFBB989B9),
            ),
          ),
          Container(
            child: Text(
              widget.text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 13
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;

  const InputWithIcon({Key? key,required this.icon,required this.hint}) : super(key: key);

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
              widget.icon,
              size: 20,
              color: Color(0xFFBB989B9),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.phone,
              // maxLength: 10,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: widget.hint,
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

