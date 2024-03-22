import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:vaccination_managment_app/api/jwt_token.dart';

class Authenticate {
  final String baseUrl; // the base URL of your Django backend
  final storage = new FlutterSecureStorage();
  final JwtToken jwt = JwtToken();

  Authenticate(this.baseUrl);

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login/'), //TODO replace with your login endpoint
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      await storage.write(key: 'jwt', value: response.body); // store the JWT
      return true;
    } else {
      return false;
    }
  }

  // register
  Future<bool> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse(
          '$baseUrl/api/register/'), //TODO replace with your register endpoint
      body: {'username': username, 'email': email, 'password': password},
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    final token = await jwt.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/api/user/'), //TODO replace with your user endpoint
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> logout() async {
    await storage.delete(key: 'jwt');
  }
}
