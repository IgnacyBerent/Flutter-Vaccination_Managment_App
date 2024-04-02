import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:vaccination_managment_app/api/jwt_token.dart';
import 'package:vaccination_managment_app/models/user.dart';

class Authenticate extends ChangeNotifier {
  final String baseUrl =
      'https://vaccinatemanagmentbackend-production.up.railway.app/user'; // the base URL of your Django backend
  final storage = const FlutterSecureStorage();
  final JwtToken jwt = JwtToken();
  User? user;

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await jwt.saveToken(responseBody);
      await getUserData();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register/'),
      body: {'username': username, 'email': email, 'password': password},
    );

    if (response.statusCode == 201) {
      // login user
      await login(username, password);
      return true;
    } else {
      return false;
    }
  }

  Future<void> getUserData() async {
    final userData = await jwt.getUserData();
    user = User.fromJson(userData);
  }

  Future<void> logout() async {
    await jwt.deleteToken();
  }

  User? get currentUser {
    return user;
  }
}
