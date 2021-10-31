import 'package:flutter/material.dart';
import 'auth.dart';
import 'styles/images.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    _navigatetomain();
  }

  _navigatetomain() async {
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (context)=>Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(),
        ),
    )
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF006D95),
      body: Container(
        child: Center(
          child: Image.asset(LogoR,width: 200,),
        ),

      ),
    );
  }
}
