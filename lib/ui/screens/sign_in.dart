import 'package:flutter/material.dart';

import 'package:daily_ui/ui/shapes/top_wave_clipper.dart';
import 'package:daily_ui/ui/shapes/bottom_wave_clipper.dart';
import 'package:daily_ui/ui/shapes/shadow_painter.dart';
import 'package:daily_ui/ui/widgets/rounded_button.dart';

// Screen for SignUp and LogIn
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  FocusNode _focusUsername = new FocusNode();
  FocusNode _focusMail = new FocusNode();
  FocusNode _focusPassword = new FocusNode();
  FocusNode _focusConfirmPassword = new FocusNode();

  bool signup;
  bool login;
  bool detail;
  bool obscure;
  bool obscureConfirm;

  @override
  void initState() {
    super.initState();
    initBools();
  }

  void initBools() {
    // Show data which is only for SignUp Page
    signup = false;
    // Show data which is only for Login Page
    login = false;
    // Show detail data, which is visible for SignUp and Login
    detail = false;
    // Obscure password textfield
    obscure = true;
    // Obscure confirm password textfield
    obscureConfirm = true;
  }

  // Size of the objects get resized when the keyboard is visible
  bool _keyboardIsVisible() {
    return MediaQuery.of(context).viewInsets.bottom != 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: <Widget>[
            middleContent(),
            blueTopWave(),
            greenBottomWave(),
          ],
        ),
        // Click somewhere outside the Textfields so the FocusNodes unfocus
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }

  Widget blueTopWave() {
    return Positioned(
      top: 0.0,
      child: CustomPaint(
        painter: BoxShadowPainter(),
        child: ClipPath(
          clipper: TopWaveClipper(),
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            // Height depends on Login, Signup or if keyboard visible
            height: _keyboardIsVisible() || signup
                ? MediaQuery.of(context).size.height * 0.06
                : MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF64B0D9),
          ),
        ),
      ),
    );
  }

  Widget greenBottomWave() {
    return Positioned(
      bottom: 0.0,
      child: ClipPath(
        clipper: BottomWaveClipper(),
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          // Height depends on Login, Signup or if keyboard visible
          height: _keyboardIsVisible()
              ? 0.0
              : signup
              ? MediaQuery.of(context).size.height * 0.06
              : MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF50D960),
        ),
      ),
    );
  }

  Widget middleContent() {
    return Positioned.fill(
      child: ListView(
        children: <Widget>[
          animatedContainerTopPadding(),
          yogaGirl(),
          usernameTextField(),
          emailTextField(),
          passwordTextField(),
          confirmPasswordTextField(),
          forgetPasswordText(),
          blueLoginButton(),
          greenSignUpButton(),
          orDivider(),
          socialMediaRow(),
          noAccount(),
          alreadyAccount(),
          bottomContainer(),
        ],
      ),
    );
  }

  // AnimatedContainer under the top shape, so the yoga girl doesn't vanish
  // and the Animations are smooth between screen changes
  Widget animatedContainerTopPadding() {
    if (_keyboardIsVisible()) {
      return AnimatedContainer(
          duration: Duration(seconds: 1),
          height: MediaQuery.of(context).size.height * 0.03);
    } else {
      return AnimatedContainer(
        duration: Duration(seconds: 1),
        // Height depends on Login, Signup or if keyboard visible
        height: login
            ? MediaQuery.of(context).size.height * 0.15
            : signup
            ? MediaQuery.of(context).size.height * 0.05
            : MediaQuery.of(context).size.height * 0.22,
      );
    }
  }

  // Stack with yoga girl picture and the shadow
  Widget yogaGirl() {
    return
      Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Extra Container to let the yoga girl in the PNG throw a shadow
          AnimatedContainer(
            duration: Duration(milliseconds: 1000),
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
              color: Colors.transparent,
              elevation: detail ? 10.0 : 15.0,
            ),
          ),
          // Container with Yoga girl pic
          AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: detail
                ? MediaQuery.of(context).size.width * 0.2
                : MediaQuery.of(context).size.width * 0.5,
            child: Image.asset("assets/yoga.png"),
          ),
        ],
      );
  }

  // Only visible after clicking "SIGN UP"
  Widget usernameTextField() {
    return AnimatedSize(
        alignment: Alignment.topCenter,
        duration: Duration(seconds: 1),
        vsync: this,
        child: AnimatedOpacity(
          opacity: detail ? 1.0 : 0.0,
          curve: Curves.easeInQuint,
          duration: Duration(seconds: 1),
          child: signup
              ? Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 70.0,
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
          )
              : Container(),
        ),
      );
  }

  // Only visible after clicking "LOG IN" or "SIGN UP"
  Widget emailTextField() {
    return
      AnimatedSize(
        duration: Duration(seconds: 1),
        vsync: this,
        child: AnimatedOpacity(
          opacity: detail ? 1.0 : 0.0,
          curve: Curves.easeInQuint,
          duration: Duration(seconds: 1),
          child: detail
              ? Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(
                top: login ? 20.0 : 10.0,
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: login ? 70.0 : 60.0,
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
          )
              : Container(),
        ),
      );
  }

  // Only visible after clicking "LOG IN" or "SIGN UP"
  Widget passwordTextField() {
    return AnimatedSize(
      duration: Duration(seconds: 1),
      vsync: this,
      child: AnimatedOpacity(
        opacity: detail ? 1.0 : 0.0,
        curve: Curves.easeInQuint,
        duration: Duration(seconds: 1),
        child: detail
            ? Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.only(
              top: 10.0,
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 60.0,
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
                  ),
                ),
              ),
            ),
          ),
        )
            : Container(),
      ),
    );
  }

  // Only visible after clicking "SIGN UP"
  Widget confirmPasswordTextField() {
    return
      AnimatedSize(
        alignment: Alignment.center,
        duration: Duration(seconds: 1),
        vsync: this,
        child: AnimatedOpacity(
          opacity: detail ? 1.0 : 0.0,
          curve: Curves.easeInQuint,
          duration: Duration(seconds: 1),
          child: signup
              ? Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 60.0,
              child: Material(
                borderRadius: BorderRadius.circular(18.0),
                elevation: 5.0,
                child: TextField(
                  focusNode: _focusConfirmPassword,
                  obscureText: obscureConfirm,
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
                      icon: Icon(obscureConfirm
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          obscureConfirm = !obscureConfirm;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          )
              : Container(),
        ),
      );
  }

  // "Forget Password?" Text
  // Only visible after clicking "LOG IN"
  Widget forgetPasswordText() {
    return
      AnimatedSize(
        duration: Duration(seconds: 1),
        vsync: this,
        child: AnimatedOpacity(
          opacity: detail ? 1.0 : 0.0,
          curve: Curves.easeInQuint,
          duration: Duration(seconds: 1),
          child: login
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
        ),
      );
  }

  // Not visible after "SIGN UP" button was clicked
  Widget blueLoginButton() {
    return AnimatedOpacity(
      opacity: !signup ? 1.0 : 0.0,
      duration: Duration(seconds: 1),
      child: !signup
          ? Align(
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.only(
            top: login ? 10.0 : 20.0,
          ),
          width: login
              ? MediaQuery.of(context).size.width * 0.7
              : MediaQuery.of(context).size.width * 0.5,
          child: RoundedButton(
            text: "LOG IN",
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
          ),
        ),
      )
          : Container(),
    );
  }

  // Not visible after "LOG IN" button was clicked
  Widget greenSignUpButton() {
    return
      AnimatedOpacity(
        opacity: !login ? 1.0 : 0.0,
        duration: Duration(seconds: 1),
        child: !login
            ? Align(
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.only(
              top: signup ? 10.0 : 0.0,
            ),
            width: signup
                ? MediaQuery.of(context).size.width * 0.7
                : MediaQuery.of(context).size.width * 0.5,
            child: RoundedButton(
              text: "SIGN UP",
              color: Color(0xFF50D960),
              onPressed: () {
                setState(() {
                  signup = !signup;
                  detail = !detail;
                });
              },
            ),
          ),
        )
            : Container(),
      );
  }

  // Divider with OR text
  // Only visible after clicking "LOG IN" or "SIGN UP"
  Widget orDivider() {
    return AnimatedOpacity(
        opacity: detail ? 1.0 : 0.0,
        duration: Duration(seconds: 1),
        child: detail
            ? Align(
          alignment: Alignment.center,
          child: Container(
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
        )
            : Container(),
      );
  }

  // Row with Google, Instagram and Facebook buttons
  // Only visible after clicking "LOG IN" or "SIGN UP"
  Widget socialMediaRow() {
    return
      AnimatedOpacity(
        opacity: detail ? 1.0 : 0.0,
        duration: Duration(seconds: 1),
        child: detail
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
                onPressed: () {
                  print("GOOGLE");
                },
              ),
              RaisedButton(
                elevation: 5.0,
                shape: CircleBorder(),
                child:
                Image.asset("assets/instagram-icon.png"),
                onPressed: () {
                  print("INSTAGRAM");
                },
              ),
              RaisedButton(
                elevation: 5.0,
                shape: CircleBorder(),
                child:
                Image.asset("assets/facebook-icon.png"),
                onPressed: () {
                  print("FACEBOOK");
                },
              ),
            ],
          ),
        )
            : Container(),
      );
  }

  // "Dont have an account?" Text
  // Only visible after clicking "LOG IN"
  Widget noAccount() {
    return
      AnimatedOpacity(
        opacity: login ? 1.0 : 0.0,
        duration: Duration(seconds: 1),
        child: login
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
      );
  }

  // "Already have an account?" Text
  // Only visible after clicking "SIGN UP"
  Widget alreadyAccount() {
    return AnimatedOpacity(
        opacity: signup ? 1.0 : 0.0,
        duration: Duration(seconds: 1),
        child: signup
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
      );
  }

  // Container at the bottom, so the last text widget doesn't disappear behind the bottom shape
  Widget bottomContainer() {
    return Container(height: MediaQuery.of(context).size.height * 0.05);
  }

}
