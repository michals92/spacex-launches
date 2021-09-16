import 'package:http/http.dart' as http;
import 'dart:convert';

const String url = "https://api.spacexdata.com/v3/launches";

class Launch {
  final String name;
  final bool? launchSuccess;

  Launch(this.name, this.launchSuccess);

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(json['mission_name'], json["launch_success"]);
  }
}

Future<List<Launch>> fetchLaunch() async {
  final response = await http
      .get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    Iterable list = json.decode(response.body);
    return list.map((model) => Launch.fromJson(model)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}