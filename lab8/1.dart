import 'package:flutter/material.dart';

class Lab8_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display Image from Assets')),
      body: Center(
        child: Image.asset('assets/images/flutter_logo.png'),
      ),
    );
  }
}
