import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sbtanew/screens/loginscreen.dart';
import 'package:sbtanew/widgets/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DashboardSbta extends StatelessWidget {
  const DashboardSbta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text("Dashboard"),
        actions: [
          IconButton(onPressed: () {
            signOut(context);

          }, icon: Icon(Icons.logout)
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text("This is dash Board !!!"),
        ),
      ),
    );
  }
  //SIGNOUT FUNCTION
  signOut(BuildContext context)async{
    final sharepref = await SharedPreferences.getInstance();
    await sharepref.clear();
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),(route) => false);
  }
}
