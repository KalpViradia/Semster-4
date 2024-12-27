import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Lab8_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cached Network Image'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl:
              'https://imgs.search.brave.com/1yRkFaoj6otuXETMqxdiCZng9QPll5s074Scg1QzXB4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/a2luZHBuZy5jb20v/cGljYy9tLzM1NS0z/NTU3NDgyX2ZsdXR0/ZXItbG9nby1wbmct/dHJhbnNwYXJlbnQt/cG5nLnBuZw',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
