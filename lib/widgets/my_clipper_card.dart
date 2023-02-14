import 'package:flutter/material.dart';

class MyClipperCard extends CustomClipper<Path> {
  final double holeRadius;

  MyClipperCard({required this.holeRadius});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(
          0.0, size.height - (size.height / 4 - holeRadius / 4) - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - (size.height / 4 - holeRadius / 4)),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - (size.height / 4 - holeRadius / 4))
      ..arcToPoint(
        Offset(size.width,
            size.height - (size.height / 4 - holeRadius / 4) - holeRadius),
        clockwise: true,
        radius: Radius.circular(1),
      );

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}