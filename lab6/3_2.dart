import 'package:flutter/material.dart';

class Lab6_3_2 extends StatelessWidget {
  const Lab6_3_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Column(
            children: [
              Expanded(child: Container(
                color: Colors.blueGrey,
              )),
              Expanded(child: Container(
                color: Colors.orange,
              )),
              Expanded(child: Container(
                color: Colors.blue,
              ))
            ],
          )),
          Expanded(child: Column(
            children: [
              Expanded(flex: 2,
                  child: Container(
                color: Colors.pink,

              )),
              Expanded(flex: 2,
                  child: Container(
                color: Colors.green,
              )),
              Expanded(child: Container(
                color: Colors.grey,
              ))
            ],
          )),
          Expanded(child: Column(
            children: [
              Expanded(child: Container(
                color: Colors.red,
              )),
              Expanded(flex: 2,
                  child: Container(
                color: Colors.yellow,
              )),
              Expanded(flex: 2,
                  child: Container(
                color: Colors.purple,
              ))
            ],
          )),
        ],
      ),
    );
  }
}