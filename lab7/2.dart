import 'package:flutter/material.dart';

class Lab7_2 extends StatelessWidget {
  const Lab7_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Widget')),
      body: Row(
        children: [
          CustomWidget('CustomText 1', 50, 'Poppins', Colors.blueAccent)
        ],
      ),
    );
  }

  Widget CustomWidget(String text, double fontSize, String fontFamily, Color color) {
    return Text(text, style: TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color));
  }
}
