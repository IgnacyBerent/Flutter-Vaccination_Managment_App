import 'package:http/http.dart' as http;
import 'package:vaccination_managment_app/api/debug_logs.dart';
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
    debugLogs(response.statusCode, 200);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => Vaccine.fromJson(item)).toList();
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
    debugLogs(response.statusCode, 200);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => VaccineRecord.fromJson(item)).toList();
  }

  Future<VaccineRecord> addVaccineRecord(
    int vaccineId,
    String firstDose,
  ) async {
    String? token = await jwt.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }
    final response = await http.post(
      Uri.parse('$url/vaccinate/user/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'vaccine_id': vaccineId,
        'fist_date': firstDose,
      }),
    );
    debugLogs(response.statusCode, 201);
    return VaccineRecord.fromJson(json.decode(response.body));
  }

  Future<void> deleteVaccineRecord(int id) async {
    String? token = await jwt.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }
    final response = await http.delete(
      Uri.parse('$url/vaccinate/uservaccine/$id/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    debugLogs(response.statusCode, 204);
  }

  Future<void> cancelVaccine(int vaccinationId) async {
    String? token = await jwt.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }
    final response = await http.post(
      Uri.parse('$url/vaccinate/uservaccine/cancel/$vaccinationId/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    debugLogs(response.statusCode, 200);
  }

  Future<void> updateVaccinationStatus(int vaccinationId, int dateIndex) async {
    // TODO: implement updateVaccinationStatus
    throw Exception('Not implemented');
  }

  Future<void> updateVaccinationDate(
      int vaccinationId, String oldDate, String newDate) async {
    String? token = await jwt.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }
    final response = await http.patch(
      Uri.parse(
          '$url/vaccinate/uservaccine/update_date/$vaccinationId/$oldDate/$newDate/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    debugLogs(response.statusCode, 204);
  }
}
