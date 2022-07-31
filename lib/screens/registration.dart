import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sbtanew/assets.dart';
import 'package:sbtanew/constants/constants.dart';
import 'package:sbtanew/screens/dashboard.dart';
import 'package:sbtanew/widgets/buttons.dart';

import 'loginscreen.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

   String? emailAddress;
   int? mobileNumber;
   var password;

  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient:  LinearGradient(
                    begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffff2277),
                        Color(0xffff4d4d),
                      ])
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -1,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 245,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(waves),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                    ),
                    Positioned(
                      bottom: 20,
                        left: 0,
                        right: 0,
                        child:Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(logo),
                            )
                          ),)
                    ),
                    Positioned(
                      top:100,
                      left: 50,
                      right:50,
                        child:Container(
                          //margin: EdgeInsets.only(left: 50,right: 50),
                          child: Form(
                            key: _formKey,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    validator: (value){
                                      if(value==null || value.isEmpty  ){
                                        return "Email is required";
                                      }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                                        return "Enter Valid Email";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(color: Colors.white70),
                                    decoration: const InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.white70),
                                      errorStyle: TextStyle(color: Colors.white70),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white70,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                  ),
                                  verticaSeperation,
                                  TextFormField(
                                    controller: mobileController,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(color: Colors.white70),
                                    decoration: const InputDecoration(
                                      hintText: "Mobile",
                                      hintStyle: TextStyle(color: Colors.white70),
                                      errorStyle: TextStyle(color: Colors.white70),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white70,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if(value==null || value.length<10 || value.isEmpty){
                                        return "Enter valid mobile number";
                                      }
                                      return null;
                                    },
                                  ),
                                  verticaSeperation,
                                  TextFormField(
                                    controller: passwordController,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(color: Colors.white70),
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.white70),
                                        errorStyle: TextStyle(color: Colors.white70),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white70,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white70,
                                        )
                                      )
                                    ),
                                    validator: (value){
                                      if(value==null || value.length<6 ){
                                        return "Password not empty ";
                                      }else if(value.isEmpty){
                                        return "Password must contain 6 character";
                                      }
                                      return null;
                                    },
                                  ),
                                  verticaSeperation,
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(color: Colors.white70),
                                    controller: confirmPassController,
                                    validator: (value){
                                      if( passwordController.text !=  confirmPassController.text  ){
                                        return "Password donot match ";
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(color: Colors.white70),
                                      errorStyle: TextStyle(color: Colors.white70),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white70,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:Colors.white70,
                                        ),
                                      ),
                                    ),

                                  ),

                                  verticaSeperation,
                                  Buttons(btnFunction: () {
                                    if(_formKey.currentState!.validate()){
                                /*      setState(() {
                                        emailAddress = emailController.text;
                                        mobileNumber = int.parse(mobileController.text);
                                        password = passwordController.text;
                                      });*/
                                      registraion();
                                    }
                                  }, btnString: "Register"),
                                ],
                              ) ),
                        ),
                    ),
                  ],
                ),
              ),
          ),
      ),

    );

  }

  Future <void> registraion ()async {
    try{
         await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);
         
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.greenAccent,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          //duration: const Duration(seconds: 10),
            content: Text("Registration Success Please Login",
              style: TextStyle(color: Colors.black),),
        ),
        );
        
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardSbta()
         ),
         );
         
  }on FirebaseAuthException catch (e){
    if(e.code == 'email-already-in-use' ) {
        print("Email already in use");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar( behavior: SnackBarBehavior.floating, content: Text("Email Already In use")));
      }
    }
  }
}
