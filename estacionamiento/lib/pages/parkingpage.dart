import 'package:estacionamiento/view/ArucoParkingView.dart';
import 'package:flutter/material.dart';

class ParkingPage extends StatelessWidget {
  const ParkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estacionamiento',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[800],
        centerTitle: true,
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 500),
          child: ArucoParkingView(),
        ),
      ),
    );
  }
}
