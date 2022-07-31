import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sbtanew/homepage.dart';
const SAVE_KEY="Share";
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SbtaHomePage());
}
