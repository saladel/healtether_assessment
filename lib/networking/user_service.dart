import 'dart:convert';
import 'package:healtether_assessment/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users: Server error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: ${e.toString()}');
    }
  }
}