import 'package:flutter/material.dart';

import 'package:daily_ui/ui/shapes/top_wave_clipper.dart';
import 'package:daily_ui/ui/shapes/bottom_wave_clipper.dart';
import 'package:daily_ui/ui/shapes/shadow_painter.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomPaint(
              painter: ShadowPainter(),
              child: ClipPath(
                  clipper: TopWaveClipper(),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Color(0xFF64B0D9))),
            ),

            Column(
              children: <Widget>[

                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Material(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset("assets/yoga.png"),
                    ),


                  ],
                ),



                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: RaisedButton(
                    elevation: 10.0,
                    onPressed: () {
                      print("LOGIN");
                    },
                    color: Color(0xFF64B0D9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: RaisedButton(
                    elevation: 10.0,
                    onPressed: () {
                      print("SIGNUP");
                    },
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    color: Color(0xFF50D960),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                  ),
                ),
              ],
            ),
            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                color: Color(0xFF50D960),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
