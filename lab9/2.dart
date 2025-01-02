import 'package:flutter/material.dart';

void main() {
  runApp(Lab9_2());
}

class Lab9_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationDrawerPages(),
    );
  }
}

class NavigationDrawerPages extends StatefulWidget {
  @override
  _NavigationDrawerPagesState createState() => _NavigationDrawerPagesState();
}

class _NavigationDrawerPagesState extends State<NavigationDrawerPages> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    Pages(1, Colors.red),
    Pages(2, Colors.green),
    Pages(3, Colors.blue),
  ];

  static Widget Pages(int pageNumber, Color color) {
    return Center(
      child: Container(
        color: color,
        child: Center(
          child: Text(
            "This is Page $pageNumber",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer Example'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24))),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 3'),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
