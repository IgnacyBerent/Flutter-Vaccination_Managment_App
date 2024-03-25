import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class JwtToken {
  final String baseUrl = '';
  final storage = const FlutterSecureStorage();

  Future<void> saveToken(Map<String, dynamic> loginResponse) async {
    await storage.write(
      key: 'jwt',
      value: loginResponse['access'],
    ); // store the access token
    await storage.write(
      key: 'refresh_jwt',
      value: loginResponse['refresh'],
    ); // store the refresh token
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'jwt');
  }

  Future<bool> isTokenExpired() async {
    final token = await getToken();
    if (token == null) {
      return true;
    }

    final parts = token.split('.');
    if (parts.length != 3) {
      return true;
    }

    final payload = B64urlEncRfc7515.decodeUtf8(parts[1]);
    final jwtPayload = json.decode(payload);
    if (DateTime.fromMillisecondsSinceEpoch(jwtPayload['exp'] * 1000)
        .isBefore(DateTime.now())) {
      return true;
    }

    return false;
  }

  Future<void> refreshToken() async {
    final refreshToken = await storage.read(key: 'refresh_jwt');

    final response = await http.post(
      Uri.parse(
          '$baseUrl/api/token/refresh/'), //TODO replace with your refresh token endpoint
      body: {'refresh': refreshToken},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await storage.write(
          key: 'jwt',
          value: responseBody['access']); //TODO store the new access token
    } else {
      //TODO Handle the error here
    }
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'jwt');
    await storage.delete(key: 'refresh_jwt');
  }

  Future<Map<String, dynamic>> getUserData() async {
    final token = await getToken();
    if (token == null) {
      throw Exception('token not found');
    }
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final resp = utf8.decode(base64Url.decode(normalized));

    final payloadMap = json.decode(resp);
    return payloadMap;
  }
}
