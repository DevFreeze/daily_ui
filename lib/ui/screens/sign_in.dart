import 'package:flutter/material.dart';

import 'package:daily_ui/ui/shapes/top_wave_clipper.dart';
import 'package:daily_ui/ui/shapes/bottom_wave_clipper.dart';
import 'package:daily_ui/ui/shapes/shadow_painter.dart';

// Screen for SignUp and LogIn
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FocusNode _focusMail = new FocusNode();
  FocusNode _focusPassword = new FocusNode();

  bool signup;
  bool login;
  bool detail;

  @override
  void initState() {
    super.initState();

    signup = false;
    login = false;
    detail = false;
  }

  // size of the objects get resized when the keyboard is visible
  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    !_keyboardIsVisible()
                        ? Container(
                            height: detail
                                ? MediaQuery.of(context).size.height * 0.15
                                : MediaQuery.of(context).size.height * 0.22,
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.03),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        // Extra Container to let the yoga girl in the PNG throw a shadow
                        Container(
                          width: detail
                              ? MediaQuery.of(context).size.width * 0.13
                              : MediaQuery.of(context).size.width * 0.33,
                          height: detail
                              ? MediaQuery.of(context).size.height * 0.03
                              : MediaQuery.of(context).size.height * 0.06,
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                            color: Colors.white,
                            elevation: detail ? 10.0 : 15.0,
                          ),
                        ),
                        // Container with Yoga girl pic
                        Container(
                          width: detail
                              ? MediaQuery.of(context).size.width * 0.2
                              : MediaQuery.of(context).size.width * 0.5,
                          child: Image.asset("assets/yoga.png"),
                        ),
                      ],
                    ),
                    // E-Mail Textfield
                    // Only visible after clicking "LOG IN" or "SIGN UP"
                    detail
                        ? Container(
                            padding: EdgeInsets.only(
                              top: 20.0,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 50.0,
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(18.0),
                                  child: TextField(
                                    focusNode: _focusMail,
                                    decoration: new InputDecoration(
                                      labelText: "Your E-Mail",
                                      labelStyle: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    // Password Textfield
                    // Only visible after clicking "LOG IN" or "SIGN UP"
                    detail
                        ? Container(
                            padding: EdgeInsets.only(
                              top: 10.0,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 50.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(18.0),
                                  elevation: 5.0,
                                  child: TextField(
                                    focusNode: _focusPassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Your Password",
                                      labelStyle: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    // "Forget Password?" Text
                    // Only visible after clicking "LOG IN" or "SIGN UP"
                    detail
                        ? Container(
                            padding: EdgeInsets.only(
                              top: 15.0,
                            ),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: Text(
                                "Forget password?",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black26,
                                ),
                              ),
                              onTap: () {
                                print("CLICK");
                              },
                            ),
                          )
                        : Container(),
                    // LOG IN button
                    // Not visible after "SIGN UP" button was clicked
                    !signup
                        ? Container(
                            padding: EdgeInsets.only(
                              top: login ? 10.0 : 20.0,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: RaisedButton(
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  color: Color(0xFF64B0D9),
                                  onPressed: () {
                                    if (login && detail) {
                                      Navigator.pushReplacementNamed(context, "/home");
                                    } else {
                                      setState(() {
                                        login = !login;
                                        detail = !detail;
                                      });
                                    }
                                  },
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
                            ),
                          )
                        : Container(),
                    // SIGN UP button
                    // Not visible after "LOG IN" button was clicked
                    !login
                        ? Container(
                            padding: EdgeInsets.only(
                              top: signup ? 10.0 : 0.0,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: RaisedButton(
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  color: Color(0xFF50D960),
                                  onPressed: () {
                                    setState(() {
                                      //signup = true;
                                      signup = !signup;
                                      detail = !detail;
                                    });
                                  },
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
                            ),
                          )
                        : Container(),
                    // Divider with OR text
                    // Only visible after clicking "LOG IN" or "SIGN UP"
                    detail
                        ? Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 40.0,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5.0),
                                        child: Divider(
                                          thickness: 2.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "OR",
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black12,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Divider(
                                          thickness: 2.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    // Row with Google, Instagram and Facebook buttons
                    // Only visible after clicking "LOG IN" or "SIGN UP"
                    detail
                        ? Container(
                            height: 30.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  elevation: 5.0,
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                  child: Image.asset("assets/google-icon.png"),
                                  onPressed: () {},
                                ),
                                RaisedButton(
                                  elevation: 5.0,
                                  shape: CircleBorder(),
                                  child:
                                      Image.asset("assets/instagram-icon.png"),
                                  onPressed: () {},
                                ),
                                RaisedButton(
                                  elevation: 5.0,
                                  shape: CircleBorder(),
                                  child:
                                      Image.asset("assets/facebook-icon.png"),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    // "Dont have an account?" Text
                    // Only visible after clicking "LOG IN"
                    login
                        ? Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 25.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black26,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: GestureDetector(
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF50D960),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          signup = true;
                                          login = false;
                                          detail = true;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    // "Already have an account?" Text
                    // Only visible after clicking "SIGN UP"
                    signup
                        ? Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 25.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black26,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: GestureDetector(
                                      child: Text(
                                        "Log in",
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF64B0D9),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          login = true;
                                          signup = false;
                                          detail = true;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),

            // The top wave shade with a shadow
            Positioned(
              top: 0.0,
              child: CustomPaint(
                painter: BoxShadowPainter(),
                child: ClipPath(
                  clipper: TopWaveClipper(),
                  child: Container(
                    height: _keyboardIsVisible()
                        ? 40.0
                        : MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFF64B0D9),
                  ),
                ),
              ),
            ),

            // Bottom shade
            Positioned(
              bottom: 0.0,
              child: ClipPath(
                clipper: BottomWaveClipper(),
                child: Container(
                  height: _keyboardIsVisible()
                      ? 0.0
                      : MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFF50D960),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
