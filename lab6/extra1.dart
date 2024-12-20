import 'package:flutter/material.dart';

class Lab6_Extra1 extends StatelessWidget {
  const Lab6_Extra1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            margin: EdgeInsets.all(12),
            color: Colors.red,
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Column(
                children: [
                  Expanded(child: Row(
                    children: [
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.brown,
                      )),
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.purple,
                      ))
                    ],
                  )),
                  Expanded(child: Row(
                    children: [
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.purple,
                      )),
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.blue,
                      ))
                    ],
                  ))
                ],
              ))
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Column(
                children: [
                  Expanded(child: Row(
                    children: [
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.red,
                      )),
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.grey,
                      )),
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.purple,
                      ))
                    ],
                  )),
                  Expanded(child: Row(
                    children: [
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.brown,
                      )),
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.blue,
                      )),
                      Expanded(child: Container(
                        margin: EdgeInsets.all(12),
                        color: Colors.yellow,
                      ))
                    ],
                  ))
                ],
              ))
            ],
          ))
        ],
      ),
    );
  }
}
