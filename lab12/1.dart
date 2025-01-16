import 'package:flutter/material.dart';

void main() {
  runApp(Lab12_1());
}

class Lab12_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SingleChildScrollView Example"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.blue,
                child: Center(child: Text('Item 1', style: TextStyle(fontSize: 30, color: Colors.white))),
              ),
              Container(  
                height: 200,
                color: Colors.green,
                child: Center(child: Text('Item 2', style: TextStyle(fontSize: 30, color: Colors.white))),
              ),
              Container(
                height: 200,
                color: Colors.red,
                child: Center(child: Text('Item 3', style: TextStyle(fontSize: 30, color: Colors.white))),
              ),
              Container(
                height: 200,
                color: Colors.orange,
                child: Center(child: Text('Item 4', style: TextStyle(fontSize: 30, color: Colors.white))),
              ),
              Container(
                height: 200,
                color: Colors.purple,
                child: Center(child: Text('Item 5', style: TextStyle(fontSize: 30, color: Colors.white))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
