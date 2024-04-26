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
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      throw Exception('Unauthorized');
    } else if (response.statusCode >= 500) {
      throw Exception('Server error');
    } else {
      throw Exception('${response.statusCode} - failed to add vaccine record');
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
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      throw Exception('Unauthorized');
    } else if (response.statusCode >= 500) {
      throw Exception('Server error');
    } else {
      throw Exception('${response.statusCode} - failed to add vaccine record');
    }
  }

  Future<VaccineRecord> addVaccineRecord(
    int vaccineId,
    String firstDose,
  ) async {
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
      if (response.statusCode == 201) {
        return VaccineRecord.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        throw Exception('Unauthorized');
      } else if (response.statusCode >= 500) {
        throw Exception('Server error');
      } else {
        throw Exception(
            '${response.statusCode} - failed to add vaccine record');
      }
    });
  }

  Future<void> deleteVaccineRecord(int id) async {
    String? token = await jwt.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }
    return http.delete(
      Uri.parse('$url/vaccinate/uservaccine/$id/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    ).then((response) {
      if (response.statusCode == 204) {
        return;
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        throw Exception('Unauthorized');
      } else if (response.statusCode >= 500) {
        throw Exception('Server error');
      } else {
        throw Exception(
            '${response.statusCode} - failed to add vaccine record');
      }
    });
  }

  Future<void> cancelVaccine(int vaccinationId) async {
    // TODO: implement cancelVaccine
    throw Exception('Not implemented');
  }

  Future<void> updateVaccinationStatus(int vaccinationId, int dateIndex) async {
    // TODO: implement updateVaccinationStatus
    throw Exception('Not implemented');
  }

  Future<void> updateVaccinationDate(
      int vaccinationId, int dateIndex, String newDate) async {
    // TODO: implement updateVaccinationDate
    throw Exception('Not implemented');
  }

  Future<void> sendPushNotificationToken(String token) async {
    // TODO: implement sendPushNotificationToken
    throw Exception('Not implemented');
  }
}
