import 'package:flutter/material.dart';

void main() {
  runApp(Lab11_3());
}

class Lab11_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image and Text Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageTextGridScreen(),
    );
  }
}

class ImageTextGridScreen extends StatelessWidget {
  final List<Map<String, String>> gridItems = [
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 1'},
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 2'},
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 3'},
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 4'},
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 5'},
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 6'},
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 7'},
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 8'},
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 9'},
    {'image': 'assets/images/flutter_logo.png', 'title': 'Text 10'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image and Text Grid View'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    gridItems[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    gridItems[index]['title']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
