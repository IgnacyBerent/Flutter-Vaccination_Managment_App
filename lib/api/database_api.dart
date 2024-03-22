import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vaccination_managment_app/models/vaccine.dart';

class DatabaseApi {
  final String url = "http://";

  Future<List<Vaccine>> fetchVaccines() async {
    final response = await http.get(Uri.parse(url + '/vaccines/list'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Vaccine.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load vaccines');
    }
  }
}
