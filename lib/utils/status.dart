import 'dart:math';

import 'package:flutter/material.dart';

class OthersStatus extends StatelessWidget {
  const OthersStatus(
      {Key? key,  required this.seen, required this.statusNum, required this.imageName})
      : super(key: key);

  final bool seen;
  final int statusNum;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CustomPaint(
            painter: StatusBorderPainter(isSeen: !seen, statusNum: statusNum),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.red,
              backgroundImage: AssetImage(imageName),
            ),
          ),
        ],
      ));
  }
}

degreeToRad(double degree) {
  return degree * pi / 180;
}

class StatusBorderPainter extends CustomPainter {
  bool isSeen;
  int statusNum;

  StatusBorderPainter({ required this.isSeen, required this.statusNum});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = isSeen ? Colors.grey : Color(0xff21bfa6)
      ..style = PaintingStyle.stroke;
    drawArc(canvas, paint, size, statusNum);
  }

  void drawArc(Canvas canvas, Paint paint, Size size, int count) {
    if (count == 1) {
      canvas.drawArc(new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToRad(0), degreeToRad(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / count;
      for (int i = 0; i < count; i++) {
        canvas.drawArc(new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToRad(degree + 4), degreeToRad(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}