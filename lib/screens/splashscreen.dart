import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sbtanew/main.dart';
import 'package:sbtanew/screens/dashboard.dart';
import 'package:sbtanew/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../assets.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    void initState() {
      checkUserLogin();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.redAccent,
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
   await Future.delayed(Duration(seconds: 10),() {});
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));
}

Future<void>checkUserLogin()async{
      final _pref = await SharedPreferences.getInstance();
      final userLogedin = _pref.getBool(SAVE_KEY);

      if(userLogedin == null || userLogedin == false ){
        gotoLogin();
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> DashboardSbta()));
      }
}
    @override
    void dipose(){
      gotoLogin();
      super.dispose();

    }


}
