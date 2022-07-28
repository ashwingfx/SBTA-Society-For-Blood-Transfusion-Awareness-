import 'package:flutter/material.dart';
import 'package:sbtanew/screens/loginscreen.dart';
class SbtaHomePage extends StatelessWidget {
  const SbtaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:SingleChildScrollView(
        child: LoginScreen(),
        ),
      ),
    );
  }
}
