import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vaccination_managment_app/models/vaccine.dart';

class DatabaseApi {
  final String url =
      "https://vaccinatemanagmentbackend-production.up.railway.app";

  Future<List<Vaccine>> fetchVaccines() async {
    final response = await http.get(Uri.parse('$url/vaccinate/list/'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Vaccine.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load vaccines');
    }
  }
}
