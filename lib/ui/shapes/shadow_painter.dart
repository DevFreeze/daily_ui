import 'package:flutter/material.dart';

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    Paint paint = new Paint();

    paint.color = Colors.transparent;

    var rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    
    canvas.drawRect(rect, paint);

    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height / 5 * 4);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height / 2, size.width, size.height);

    path.lineTo(size.width, 0.0);

    path.close();

    canvas.drawShadow(path, Colors.black54, 10.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}