import 'package:http/http.dart' as http;
import 'dart:convert';
import 'launch.dart';

const baseUrl = "https://api.spacexdata.com/v3";

class API {
  static Future<List<Launch>> fetchLaunches() async {
    final response = await http
        .get(Uri.parse(baseUrl + "/launches"));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => Launch.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<Launch> fetchLaunchDetail(int id) async {
    final response = await http
        .get(Uri.parse(baseUrl + "/launches/$id" ));

    if (response.statusCode == 200) {
      return Launch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load launch');
    }
  }
}