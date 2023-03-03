import 'dart:convert';
import 'package:article_app_flutter/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  // final _baseUrl = 'https://63fd81456a135172e071c8c6.mockapi.io/api/v1';
  final _baseUrl = 'http://10.0.2.2:3000/api/v1';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/articles'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Article> article = it.map((e) => Article.fromJson(e)).toList();
        return article;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String title, String body) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/articles'),
          body: {"title": title, "body": body});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
