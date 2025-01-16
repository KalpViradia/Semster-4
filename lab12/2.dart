import 'package:flutter/material.dart';

void main() {
  runApp(Lab12_2());
}

class Lab12_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView/GridView inside SingleChildScrollView"),
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
                height: 300,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('List Item ${index+1}'),
                    );
                  },
                ),
              ),
              Container(
                height: 400,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(child: Text('Grid Item ${index+1}')),
                    );
                  },
                ),
              ),
              Container(
                height: 200,
                color: Colors.green,
                child: Center(child: Text('Item 2', style: TextStyle(fontSize: 30, color: Colors.white))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
