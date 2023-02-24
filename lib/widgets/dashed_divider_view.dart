import 'package:flutter/material.dart';

class DashedDividerView extends StatelessWidget {
  final double height;
  final Color color;

  DashedDividerView({this.height = 1.0, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedDividerPainter(height: height, color: color),
    );
  }
}

class _DashedDividerPainter extends CustomPainter {
  final double height;
  final Color color;

  _DashedDividerPainter({required this.height, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = height
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double dashWidth = 10.0;
    double dashSpace = 5.0;
    double startY = 0.0;
    double currentX = 0.0;
    bool isDashed = true;

    while (currentX < size.width) {
      if (isDashed) {
        canvas.drawLine(
          Offset(currentX, startY),
          Offset(currentX + dashWidth, startY),
          paint,
        );
        currentX += dashWidth;
      } else {
        currentX += dashSpace;
      }
      isDashed = !isDashed;
    }
  }

  @override
  bool shouldRepaint(_DashedDividerPainter oldDelegate) {
    return oldDelegate.height != height || oldDelegate.color != color;
  }
}
