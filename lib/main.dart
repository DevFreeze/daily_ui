import 'package:flutter/material.dart';

import 'package:daily_ui/ui/screens/sign_in.dart';
import 'package:daily_ui/ui/screens/homepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyUI',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SignIn(),
        '/home': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
      },
    );
  }
}