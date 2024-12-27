import 'package:flutter/material.dart';

class Lab7_1 extends StatelessWidget {
  const Lab7_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello World')),
      body: Row(
        children: [
          Text('Hello World', style: TextStyle(color: Colors.green, fontSize: 50))
        ],
      ),
    );
  }
}
