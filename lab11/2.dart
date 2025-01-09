import 'package:flutter/material.dart';

void main() {
  runApp(Lab11_2());
}

class Lab11_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageGridScreen(),
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/flutter_logo.png',
    'assets/images/flutter_logo.png',
    'assets/images/flutter_logo.png',
    'assets/images/flutter_logo.png',
    'assets/images/flutter_logo.png',
    'assets/images/flutter_logo.png',
    'assets/images/flutter_logo.png',
    'assets/images/flutter_logo.png',
    'assets/images/flutter_logo.png',
    'assets/images/flutter_logo.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Grid View'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
