import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Map<String, String> headers = {"Content-Type": "application/json"};

  Future<dynamic> get() async {
    var data;
    String url = "https://restcountries.com/v3.1/all";
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        data = jsonData;
      }
    } catch (err) {
      print(err);
    }
    return data;
  }
}
