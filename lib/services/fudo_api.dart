import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/fudo.dart';

class FudoApi {
  static const baseUrl = "https://pet-sumu.jp/wp-json/wp/v2/fudo";

  static Future<List<Fudo>> fetchFudos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode != 200) {
      throw Exception("物件データの取得に失敗しました");
    }

    final List<dynamic> data = jsonDecode(response.body);

    return data.map((json) => Fudo.fromJson(json)).toList();
  }
}
