import 'dart:developer';

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

  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await jwt.saveToken(responseBody);
      await getUserData();
    } else {
      if (response.statusCode == 401) {
        throw Exception('Invalid credentials');
      } else if (response.statusCode == 400) {
        throw Exception('Bad request');
      } else {
        throw Exception('Failed to login');
      }
    }
  }

  Future<void> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register/'),
      body: {'username': username, 'email': email, 'password': password},
    );

    if (response.statusCode == 201) {
      await login(username, password);
    } else {
      if (response.statusCode == 400) {
        throw Exception('Bad request');
      } else {
        throw Exception('Failed to register');
      }
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

  Future<bool> refreshToken() async {
    String? rt = await jwt.getRefreshToken();
    if (rt == null) {
      log('No refresh token found');
      return false;
    }

    final response = await http.post(
      Uri.parse('$baseUrl/api/token/refresh/'),
      body: {'refresh': rt},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await jwt.saveToken(responseBody);
      await getUserData();
      return true;
    } else {
      if (response.statusCode == 400) {
        log('Bad request');
        return false;
      } else {
        log('Failed to refresh token');
        return false;
      }
    }
  }
}
