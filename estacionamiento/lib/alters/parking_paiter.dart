import 'package:flutter/material.dart';

class ParkingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Dibujar espacios de parqueo en el lado izquierdo
    for (int i = 0; i < 3; i++) {
      canvas.drawRect(
          Rect.fromLTWH(20, 50 + i * 100, size.width / 2 - 40, 60), paint);
    }

    // Dibujar espacios de parqueo en el lado derecho
    for (int i = 0; i < 3; i++) {
      canvas.drawRect(
          Rect.fromLTWH(
              size.width / 2 + 20, 50 + i * 100, size.width / 2 - 40, 60),
          paint);
    }

    // Dibujar camino de entrada y salida
    final pathPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(size.width / 2, size.height - 50),
        Offset(size.width / 2, 50), pathPaint);

    // Dibujar autos en espacios de parqueo
    final carColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple
    ];

    // Autos en el lado izquierdo
    for (int i = 0; i < 3; i++) {
      final carPaint = Paint()
        ..color = carColors[i]
        ..style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(25, 55 + i * 100, 40, 25), carPaint);
    }

    // Autos en el lado derecho
    for (int i = 0; i < 3; i++) {
      final carPaint = Paint()
        ..color = carColors[i + 2]
        ..style = PaintingStyle.fill;
      canvas.drawRect(
          Rect.fromLTWH(size.width / 2 + 25, 55 + i * 100, 40, 25), carPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
