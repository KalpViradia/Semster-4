import 'package:flutter/material.dart';

class Lab6_1 extends StatelessWidget {
  const Lab6_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            color: Colors.red,
          )),
          Expanded(child: Container(
            color: Colors.green,
          )),
          Expanded(child: Container(
            color: Colors.blue,
          ))
        ],
      ),
    );
  }
}
