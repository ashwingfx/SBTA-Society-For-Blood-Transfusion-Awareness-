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
        color: Colors.white,
       /* gradient: LinearGradient(
          begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:[
              Color(0xe7e7e7e7),
              Color(0xe7e7e7e7),
            ]
        ),*/
      ),
      child: Center(
        child: Container(
          width: 200,
          height: 200,
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
