import 'package:flutter/material.dart';

class InteractCustomPaint extends CustomPainter {
  InteractCustomPaint();
  @override
  void paint(Canvas canvas, Size size) {
    drawInteractBar(canvas, size);
  }

  void drawInteractBar(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.white70
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final circlePaint = Paint()
      ..color = Colors.white54
      ..style = PaintingStyle.fill;

    final arrowPaint = Paint()
      ..color = Colors.black87.withOpacity(0.25)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    final dx = size.width / 2;

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(dx, size.height),
      linePaint,
    );

    canvas.drawCircle(
      Offset(dx, size.height / 2),
      30.0,
      circlePaint,
    );

    final leftArrowPath = arrowPath(size, dx);
    canvas.drawPath(leftArrowPath, arrowPaint);
    final rightArrowPath = arrowPath(size, dx, isLeft: false);
    canvas.drawPath(rightArrowPath, arrowPaint);
  }

  Path arrowPath(Size size, double dx, {bool isLeft = true}) {
    final path = Path();
    path.moveTo(dx + (isLeft ? -8 : 8), size.height / 2 - 15);
    path.lineTo(dx + (isLeft ? -22 : 22), size.height / 2 - 0);
    path.lineTo(dx + (isLeft ? -8 : 8), size.height / 2 + 15);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(InteractCustomPaint oldDelegate) => false;
}
