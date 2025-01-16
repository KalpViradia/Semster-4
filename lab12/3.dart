import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(Lab12_3());
}

class Lab12_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Date Formatter")),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Formatted Date (dd/MM/yyyy): ${DateFormat('dd/MM/yyyy').format(DateTime.now())}'),
              SizedBox(height: 10),
              Text('Formatted Date (dd-MM-yyyy): ${DateFormat('dd-MM-yyyy').format(DateTime.now())}'),
              SizedBox(height: 10),
              Text('Formatted Date (dd-MMM-yyyy): ${DateFormat('dd-MMM-yyyy').format(DateTime.now())}'),
              SizedBox(height: 10),
              Text('Formatted Date (dd-MM-yy): ${DateFormat('dd-MM-yy').format(DateTime.now())}'),
              SizedBox(height: 10),
              Text('Formatted Date (dd MMM, yyyy): ${DateFormat('dd MMM, yyyy').format(DateTime.now())}'),
            ],
          ),
        ),
      ),
    );
  }
}
