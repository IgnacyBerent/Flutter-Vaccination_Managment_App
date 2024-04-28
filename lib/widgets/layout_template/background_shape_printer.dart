import 'dart:math';
import 'package:flutter/rendering.dart';

class BackgroundShapePainter extends CustomPainter {
  final Random random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    const gradient = LinearGradient(
      colors: [Color(0xFF00CB94), Color(0xFF00AAA0)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final cornerPoint = Paint()..color = const Color.fromARGB(0, 0, 0, 0);

    final bezzierPoint = Paint()..color = const Color.fromARGB(0, 255, 0, 0);

    double px1 = size.width * 0.92;
    double py1 = size.height * 0.1;

    double px2 = size.width * 0.35;
    double py2 = size.height * 0.35;

    double px3 = size.width * 0;
    double py3 = size.height * 0.25;

    double bx1 = size.width * 0.89;
    double by1 = size.height * (py1 + 0) / (size.height * 2);

    double bx2 = size.width * 0.75;
    double by2 = size.height * (py2 + py1) / (size.height * 2);

    double bx3 = size.width * 0.14;
    double by3 = size.height * (py3 + py2) / (size.height * 2);

    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, px3, py3));

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.8, 0)
      ..quadraticBezierTo(
        bx1,
        by1,
        px1,
        py1,
      )
      ..quadraticBezierTo(
        bx2,
        by2,
        px2,
        py2,
      )
      ..quadraticBezierTo(
        bx3,
        by3,
        px3,
        py3,
      )
      ..close();

    canvas.drawPath(path, paint);
    // Draw points at the control points and end points of the bezier curves
    canvas.drawCircle(
      Offset(bx1, by1),
      5,
      bezzierPoint,
    );
    canvas.drawCircle(
      Offset(px1, py1),
      5,
      cornerPoint,
    );
    canvas.drawCircle(
      Offset(bx2, by2),
      5,
      bezzierPoint,
    );
    canvas.drawCircle(
      Offset(px2, py2),
      5,
      cornerPoint,
    );
    canvas.drawCircle(
      Offset(bx3, by3),
      5,
      bezzierPoint,
    );
    canvas.drawCircle(
      Offset(px3, py3),
      5,
      cornerPoint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
