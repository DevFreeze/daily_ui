import 'package:flutter/material.dart';

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height / 5 * 4);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height / 2, size.width, size.height);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
