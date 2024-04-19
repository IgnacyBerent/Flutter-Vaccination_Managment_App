import 'package:http/http.dart' as http;
import 'package:vaccination_managment_app/api/jwt_token.dart';
import 'dart:convert';

import 'package:vaccination_managment_app/models/vaccine.dart';
import 'package:vaccination_managment_app/models/vaccine_record.dart';

class DatabaseApi {
  final String url =
      "https://vaccinatemanagmentbackend-production.up.railway.app";
  final JwtToken jwt = JwtToken();

  Future<List<Vaccine>> fetchVaccines() async {
    final response = await http.get(Uri.parse('$url/vaccinate/list/'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Vaccine.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load vaccines');
    }
  }

  Future<List<VaccineRecord>> fetchVaccineRecords() async {
    String? token = await jwt.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }
    final response = await http.get(
      Uri.parse('$url/vaccinate/user/'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => VaccineRecord.fromJson(item)).toList();
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to load vaccine records');
    }
  }

  Future<VaccineRecord> addVaccineRecord(
      int vaccineId, String firstDose) async {
    String? token = await jwt.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }
    return http
        .post(
      Uri.parse('$url/vaccinate/user/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'vaccine_id': vaccineId,
        'fist_date': firstDose,
      }),
    )
        .then((response) {
      if (response.statusCode == 200) {
        return VaccineRecord.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized');
      } else {
        throw Exception('Failed to add vaccine record');
      }
    });
  }
}
