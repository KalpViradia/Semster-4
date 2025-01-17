import 'package:flutter/material.dart';

void main() {
  runApp(Lab13_3());
}

class Lab13_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget Pages(pageName, Color color) {
      return Center(
        child: Container(
          color: color,
          child: Center(
            child: Text(
              "This is $pageName Page",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      );
    }

    List<Widget> pages = [
      Pages('Home', Colors.red),
      Pages('Search', Colors.green),
      Pages('profile', Colors.blue),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Example'),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
