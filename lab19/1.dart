import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter JSON Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JsonDataScreen(),
    );
  }
}

class JsonDataScreen extends StatefulWidget {
  @override
  _JsonDataScreenState createState() => _JsonDataScreenState();
}

class _JsonDataScreenState extends State<JsonDataScreen> {
  late Future<List<dynamic>> data;

  @override
  void initState() {
    super.initState();
    data = loadJsonData();
  }

  Future<List<dynamic>> loadJsonData() async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('assets/lab19_data.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Data from Asset'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Data Available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return ListTile(
                  title: Text(item['name'] ?? 'No Name'),
                  subtitle: Text(item['description'] ?? 'No Description'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
