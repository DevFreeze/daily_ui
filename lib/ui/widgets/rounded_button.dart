import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final String text;
  final Color color;
  final VoidCallback onPressed;

  const RoundedButton({Key key, this.text, this.color, this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: color,
      onPressed: onPressed,
      child: Text(
        text ?? "",
        style: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w900,
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}