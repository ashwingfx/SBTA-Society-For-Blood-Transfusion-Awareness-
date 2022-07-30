import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sbtanew/screens/loginscreen.dart';

import '../assets.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    void initState() {
    gotoLogin();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:[
              Color(0xe7ffffff),
              Color(0xe7ffffff),
            ]
        ),
      ),
      child: Center(
        child: Container(
          width: 250,
          height: 250,
          child:Lottie.asset(lotta),
        ),
      ),
    );
  }
Future <void> gotoLogin()async{
   await Future.delayed(Duration(seconds: 5),() {});
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));
}
}
