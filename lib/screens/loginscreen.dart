import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sbtanew/assets.dart';
import 'package:sbtanew/screens/dashboard.dart';
import 'package:sbtanew/screens/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';
import '../main.dart';
import '../widgets/buttons.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State {
  //const LoginScreen({Key? key}) : super(key: key);

  final  userNameController = TextEditingController();
  final  passWordController = TextEditingController();

  String? userName;
  var passWord;


  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Material(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:[
                    Color(0xffff2277),
                    Color(0xffff4d4d),
                  ]
              ),
             /* image: DecorationImage(
                image: AssetImage(backGround),
                fit: BoxFit.cover,
                ),*/
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
                              controller: userNameController,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Enter username";
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
                              controller: passWordController,
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
                              if(_formKey.currentState!.validate()) {
                                userLogin(context);
                                checkLogin(context);
                              }
                            }, btnString: "Login"),

                            verticaSeperation,

                            TextButton(
                                onPressed:() {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                                }, child: Text("Not registered? SignUp", style: TextStyle(color: Colors.white)))
                          ],
                        ),

                      ),

                    ),
                ),

                Positioned(
                  bottom: 20,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(logo),
                        )
                      ),
                    )
                )
              ],
            ),
            ),
        ),
      ),
    );
  }

    void checkLogin(BuildContext context)async{

      if(userNameController.text == passWordController.text){
      final _sharePref = await SharedPreferences.getInstance();
            await _sharePref.setBool(SAVE_KEY, true);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DashboardSbta()));
    }
  }

  Future<void> userLogin(BuildContext context)async{
    try{
      await _auth.signInWithEmailAndPassword(email:userNameController.text,password: passWordController.text);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DashboardSbta()));

    }on FirebaseAuthException catch (e){
      if(e.code== 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No registered user found")));
      }else if(e.code=="wrong-password"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Username or password not match")));
      }

    }

  }
}
