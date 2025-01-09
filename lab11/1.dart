import 'package:flutter/material.dart';

void main() {
  runApp(Lab11_1());
}

class Lab11_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CityListScreen(),
    );
  }
}

class CityListScreen extends StatelessWidget {
  final List<String> cities = [
    'New York',
    'London',
    'Tokyo',
    'Paris',
    'Sydney',
    'Berlin',
    'Toronto',
    'Dubai',
    'Los Angeles',
    'Rio de Janeiro'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities List'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
          );
        },
      ),
    );
  }
}
