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
  FocusNode _focusUsername = new FocusNode();
  FocusNode _focusMail = new FocusNode();
  FocusNode _focusPassword = new FocusNode();
  FocusNode _focusConfirmPassword = new FocusNode();

  bool signup;
  bool login;
  bool detail;
  bool obscure;
  bool obscure_confirm;

  @override
  void initState() {
    super.initState();
    initBools();
  }

  // size of the objects get resized when the keyboard is visible
  bool _keyboardIsVisible() {
    return MediaQuery.of(context).viewInsets.bottom != 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      // Container under the top shape, so the yoga girl doesn't vanish
                      // Height depends on Login, Signup or if keyboard visible
                      !_keyboardIsVisible()
                          ? Container(
                              height: login
                                  ? MediaQuery.of(context).size.height * 0.15
                                  : signup
                                      ? MediaQuery.of(context).size.height *
                                          0.05
                                      : MediaQuery.of(context).size.height *
                                          0.22,
                            )
                          : Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                      // Stack with yoga girl picture and the shadow
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
                      // Username Textfield
                      // Only visible after clicking "SIGN UP"
                      signup
                          ? Container(
                              padding: EdgeInsets.only(
                                top: 20.0,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 50.0,
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(18.0),
                                    child: TextField(
                                      focusNode: _focusUsername,
                                      decoration: new InputDecoration(
                                        labelText: "Username",
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
                      // E-Mail Textfield
                      // Only visible after clicking "LOG IN" or "SIGN UP"
                      detail
                          ? Container(
                              padding: EdgeInsets.only(
                                top: login ? 20.0 : 10.0,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 50.0,
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(18.0),
                                    child: TextField(
                                      focusNode: _focusMail,
                                      decoration: new InputDecoration(
                                        labelText: login
                                            ? "E-Mail or Username"
                                            : "E-Mail",
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 50.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(18.0),
                                    elevation: 5.0,
                                    child: TextField(
                                      focusNode: _focusPassword,
                                      obscureText: obscure,
                                      decoration: InputDecoration(
                                          labelText: "Password",
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
                                          suffixIcon: IconButton(
                                            icon: Icon(obscure
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                obscure = !obscure;
                                              });
                                            },
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      // Confirm Password Textfield
                      // Only visible after clicking "SIGN UP"
                      signup
                          ? Container(
                              padding: EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 50.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(18.0),
                                    elevation: 5.0,
                                    child: TextField(
                                      focusNode: _focusConfirmPassword,
                                      obscureText: obscure_confirm,
                                      decoration: InputDecoration(
                                          labelText: "Confirm Password",
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
                                          suffixIcon: IconButton(
                                            icon: Icon(obscure_confirm
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                obscure_confirm =
                                                    !obscure_confirm;
                                              });
                                            },
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      // "Forget Password?" Text
                      // Only visible after clicking "LOG IN"
                      login
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: RaisedButton(
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    color: Color(0xFF64B0D9),
                                    onPressed: () {
                                      if (login && detail) {
                                        Navigator.pushReplacementNamed(
                                            context, "/home");
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
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
                                    child:
                                        Image.asset("assets/google-icon.png"),
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    elevation: 5.0,
                                    shape: CircleBorder(),
                                    child: Image.asset(
                                        "assets/instagram-icon.png"),
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
                                          FocusScope.of(context).unfocus();
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
                                          FocusScope.of(context).unfocus();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      // Container at the bottom, so the last textwidget doesn't disappear behind the bottom shape
                      Container(
                          height: MediaQuery.of(context).size.height * 0.05),
                    ],
                  ),
                ),
              ),

              // blue top wave shade with a shadow
              Positioned(
                top: 0.0,
                child: CustomPaint(
                  painter: BoxShadowPainter(),
                  child: ClipPath(
                    clipper: TopWaveClipper(),
                    child: Container(
                      height: _keyboardIsVisible() || signup
                          ? MediaQuery.of(context).size.height * 0.06
                          : MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFF64B0D9),
                    ),
                  ),
                ),
              ),

              // Green bottom wave shade
              Positioned(
                bottom: 0.0,
                child: ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Container(
                    height: _keyboardIsVisible()
                        ? 0.0
                        : signup
                            ? MediaQuery.of(context).size.height * 0.06
                            : MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFF50D960),
                  ),
                ),
              ),
            ],
          ),
          // Click somewhere outside the Textfields so the FocusNodes unfocus
          onTap: () {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }

  void initBools() {
    // show data which is only for SignUp Page
    signup = false;
    // show data which is only for Login Page
    login = false;
    // Show detail data, which is visible for SignUp and Login
    detail = false;
    // obscure password textfield
    obscure = true;
    // obscure confirm password textfield
    obscure_confirm = true;
  }
}