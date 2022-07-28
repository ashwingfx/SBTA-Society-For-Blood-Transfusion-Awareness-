import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  //const Buttons({Key? key}) : super(key: key);

  final String btnString;
  final Function() btnFunction;

  Buttons({required this.btnFunction, required this.btnString});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        primary: Colors.redAccent,
        padding: EdgeInsets.only(left:40,right: 40)
        //shape: StadiumBorder(),
      ),
        onPressed: btnFunction,
        child: Text(btnString),
    );
  }
}
