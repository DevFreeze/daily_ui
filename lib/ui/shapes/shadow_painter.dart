import 'package:flutter/material.dart';

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height / 5 * 4);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height / 2, size.width, size.height);

    path.lineTo(size.width, 0.0);

    path.close();

    canvas.drawShadow(path, Colors.black54, 10.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}