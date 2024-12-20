import 'package:flutter/material.dart';

class Lab6_3_1 extends StatelessWidget {
  const Lab6_3_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Row(
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
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.brown,
              )),
              Expanded(child: Container(
                color: Colors.blueGrey,
              )),
              Expanded(child: Container(
                color: Colors.purple,
              ))
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.black,
              )),
              Expanded(child: Container(
                color: Colors.pink,
              )),
              Expanded(child: Container(
                color: Colors.orange,
              ))
            ],
          )),
        ],
      ),
    );
  }
}
