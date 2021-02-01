import 'package:flutter/material.dart';

// Design Cloud Top of screen
class CloudTopLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 400;
    final double _yScaling = size.height / 900;
    path.lineTo(-4 * _xScaling, -17 * _yScaling);
    path.cubicTo(
      51.228 * _xScaling,
      -17 * _yScaling,
      96 * _xScaling,
      27.772 * _yScaling,
      96 * _xScaling,
      83 * _yScaling,
    );
    path.cubicTo(
      96 * _xScaling,
      138.228 * _yScaling,
      51.228 * _xScaling,
      183 * _yScaling,
      -4 * _xScaling,
      183 * _yScaling,
    );
    path.cubicTo(
      -59.228 * _xScaling,
      183 * _yScaling,
      -104 * _xScaling,
      138.228 * _yScaling,
      -104 * _xScaling,
      83 * _yScaling,
    );
    path.cubicTo(
      -104 * _xScaling,
      27.77199999999999 * _yScaling,
      -59.228 * _xScaling,
      -17 * _yScaling,
      -4 * _xScaling,
      -17 * _yScaling,
    );
    path.cubicTo(
      -4 * _xScaling,
      -17 * _yScaling,
      -4 * _xScaling,
      -17 * _yScaling,
      -4 * _xScaling,
      -17 * _yScaling,
    );
    path.lineTo(86 * _xScaling, -87 * _yScaling);
    path.cubicTo(
      141.228 * _xScaling,
      -87 * _yScaling,
      186 * _xScaling,
      -42.228 * _yScaling,
      186 * _xScaling,
      13 * _yScaling,
    );
    path.cubicTo(
      186 * _xScaling,
      68.22800000000001 * _yScaling,
      141.228 * _xScaling,
      113 * _yScaling,
      86 * _xScaling,
      113 * _yScaling,
    );
    path.cubicTo(
      30.77199999999999 * _xScaling,
      113 * _yScaling,
      -14 * _xScaling,
      68.228 * _yScaling,
      -14 * _xScaling,
      13 * _yScaling,
    );
    path.cubicTo(
      -14 * _xScaling,
      -42.227999999999994 * _yScaling,
      30.772 * _xScaling,
      -87 * _yScaling,
      86 * _xScaling,
      -87 * _yScaling,
    );
    path.cubicTo(
      86 * _xScaling,
      -87 * _yScaling,
      86 * _xScaling,
      -87 * _yScaling,
      86 * _xScaling,
      -87 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
