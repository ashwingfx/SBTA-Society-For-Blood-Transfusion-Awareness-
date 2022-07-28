import 'package:flutter/material.dart';
import 'package:sbtanew/assets.dart';

import '../constants/constants.dart';
import '../widgets/buttons.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State {
  //const LoginScreen({Key? key}) : super(key: key);

  final  userNmae = TextEditingController();
  final TextEditingController passWord = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backGround),
          fit: BoxFit.cover,
          ),
        ),
      child: Stack(
        children: [
          Positioned(
            bottom: -2,
              right: -1,
              child: Container(
                height: 245,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(waves),
                    fit: BoxFit.fill,
                  ),
                ),
              )
          ),
          Positioned(
            top: 150,
              left:0,
               right: 0,
              child: Container(
                padding: EdgeInsets.only(left: 50,right: 50),
                child: Form(
                  key:_formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userNmae,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Type your username";
                          }
                            return null;

                        },
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white70),
                        decoration: const InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white70),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                          )
                        ),
                      ),
                      verticaSeperation,
                      TextFormField(
                        controller: passWord,
                        validator: (value){
                          if(value==null || value.length<6){
                            return "Enter Password";
                          }
                            return null;

                        },
                        keyboardType: TextInputType.text,
                        style: TextStyle(color:Colors.white70),
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      verticaSeperation,
                      Buttons(btnFunction: () {
                        if(_formKey.currentState!.validate()){

                        }
                      }, btnString: "Login"),
                      verticaSeperation,
                      TextButton(
                          onPressed:() {
                      
                          }, child: Text("Not registered? SignUp", style: TextStyle(color: Colors.white)))
                    ],
                  ),

                ),

              ),
          ),

          Positioned(
            bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(logo),
                  )
                ),
              )
          )
        ],
      ),
      );
  }
}
