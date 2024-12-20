import 'package:flutter/material.dart';

class Lab6_2 extends StatelessWidget {
  const Lab6_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Column(

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
