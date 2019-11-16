import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestGet{
  static Future<String> get() async {
    final response = await http.get("http://graph.team08.xp65.renault-digital.com/processed/bike.json");
    if(response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}