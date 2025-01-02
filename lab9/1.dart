import 'package:flutter/material.dart';

void main() {
  runApp(Lab9_1());
}

class Lab9_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabPages(),
    );
  }
}

class TabPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab View Example"),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            tabPages(1, Colors.red),
            tabPages(2, Colors.green),
            tabPages(3, Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget tabPages(int tabNumber, Color color) {
    return Center(
      child: Container(
        color: color,
        child: Center(
          child: Text(
            "This is Tab $tabNumber",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
