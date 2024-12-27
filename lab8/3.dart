import 'package:flutter/material.dart';

class Lab8_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Example'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/flutter_logo.png',
                fit: BoxFit.contain,
              ),
            ),
            // Text Widget
            Positioned(
              bottom: 20,
              child: Text(
                'Flutter Logo',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
