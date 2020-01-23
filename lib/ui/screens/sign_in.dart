import 'package:flutter/material.dart';

import 'package:daily_ui/ui/shapes/top_wave_clipper.dart';
import 'package:daily_ui/ui/shapes/bottom_wave_clipper.dart';
import 'package:daily_ui/ui/shapes/shadow_painter.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // The top wave shade with a shadow
            CustomPaint(
              painter: BoxShadowPainter(),
              child: ClipPath(
                clipper: TopWaveClipper(),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  color: Color(0xFF64B0D9),
                ),
              ),
            ),
            // The picture, Log in button and Sign up button
            // In an extra column, because of spacing
            Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      // Extra Container to let the yoga girl in the PNG throw a shadow
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Material(
                          color: Colors.transparent,
                          elevation: 20.0,
                        ),
                      ),
                      Image.asset("assets/yoga.png"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 30.0,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: RaisedButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    color: Color(0xFF64B0D9),
                    onPressed: () {},
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: RaisedButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    color: Color(0xFF50D960),
                    onPressed: () {},
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Bottom shade
            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                height: 100,
                width: double.infinity,
                color: Color(0xFF50D960),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
