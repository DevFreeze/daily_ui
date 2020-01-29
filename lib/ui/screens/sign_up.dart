import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset("assets/yoga.png"),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: FlatButton(
              onPressed: () {
                print("LOGIN");
              },
              color: Color(0xFF64B0D9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: Text("LOGIN"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: FlatButton(
              onPressed: () {
                print("SIGNUP");
              },
              child: Text("SIGNUP"),
              color: Color(0xFF50D960),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
            ),
          ),
        ],
      )),
    );
  }
}
