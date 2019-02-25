import 'package:flutter/material.dart';
import 'dart:math';

class RevealPainter extends CustomPainter{

  double _fraction;
  Size _screenSize;
  RevealPainter(this._fraction ,this._screenSize);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    var paint = Paint()
        ..color =Colors.red
        ..style =PaintingStyle.fill;

    var finalRadius = sqrt(pow(_screenSize.width / 2, 2) +pow(_screenSize.height , 2));

    var radius =  finalRadius * _fraction;

    canvas.drawCircle(Offset(size.width/2, size.height/2), radius, paint);
  }

  @override
  bool shouldRepaint(RevealPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate._fraction != _fraction;
  }



}