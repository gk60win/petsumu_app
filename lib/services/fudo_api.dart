import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/fudo.dart';

class FudoApi {
  static const String baseUrl = "https://pet-sumu.jp/wp-json/wp/v2/fudo";

  static Future<List<Fudo>> fetchFudos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((item) => Fudo.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load fudos: ${response.statusCode}");
    }
  }
}
