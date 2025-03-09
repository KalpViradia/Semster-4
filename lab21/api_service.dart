import 'dart:convert';
import 'package:http/http.dart' as http;

import '../lab21/user.dart';
class ApiService{
  String baseUrl = "https://66ed2084380821644cdb7fe9.mockapi.io/users";

  Future<List<User>> getAllUser() async {
    List<User> users = [];
    var res =await http.get(Uri.parse(baseUrl));
    List<dynamic> data = jsonDecode(res.body);
    data.forEach((element) {
      users.add(User.fromJson(element));
    },);
    return users;
  }

  Future<User> getUserById(String id) async {
    var res = await http.get(Uri.parse('$baseUrl/$id'));
    dynamic u = jsonDecode(res.body);
    User user = User.fromJson(u);
    return user;
  }

  Future<void> addUser(User user) async {
    var res = await http.post(Uri.parse(baseUrl),
        body: (user.toJson()));
  }

  Future<User> editUser(String id, User user) async {
    var res = await http.put(
      Uri.parse('$baseUrl/$id'),
      body: jsonEncode(user.toJson()),
    );
    return user;
  }

  Future<void> deleteUser(String id) async {
    var res = await http.delete(Uri.parse('$baseUrl/$id'));
  }
}