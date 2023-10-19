import 'package:flutter/material.dart';

class CustomTicket extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    //Radius
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(10),
      ),
    );

    // Left Round In
    path.addOval(
      Rect.fromCircle(
        center: Offset(0, (size.height / 3) * 1.8), // Position Roun In Left
        radius: 15, // Size
      ),
    );

    // Right Round In
    path.addOval(
      Rect.fromCircle(
        center: Offset(
            size.width, (size.height / 3) * 1.8), // Position Roun In Right
        radius: 15, // Size
      ),
    );

    // Horizontal Line Dash
    const dashWidth = 10;
    const dashSpace = 11;
    final dashCount = size.width ~/ (dashWidth + dashSpace);

    for (var i = 0; i < dashCount - 1; i++) {
      path.addRect(
        Rect.fromLTWH(
          i * (dashWidth + dashSpace).toDouble() + 20,
          (size.height / 3) * 1.8,
          dashWidth.toDouble(),
          1.5,
        ),
      );
    }

    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
