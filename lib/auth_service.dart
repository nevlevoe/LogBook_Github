import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _baseUrl = 'http://localhost:5000';

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Save user data if needed
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Save user data if needed
      return true;
    } else {
      return false;
    }
  }
}
