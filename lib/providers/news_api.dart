import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fudeo_start_project_app/models/article.dart';

/// Documentation: https://newsapi.org/docs/endpoints/top-headlines
Future<List<Article>> topHeadlines() async {
  final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=ansa&apiKey=6a363f5724254353b5a4d5632bd23157"));
  List articles = json.decode(response.body)["articles"];

  return articles.map((data) => Article.fromData(data)).toList();
}

/// Documentation: https://newsapi.org/docs/endpoints/everything
Future<List<Article>> everything() async {
  final response = await http.get(Uri.parse("https://newsapi.org/v2/everything?sources=ansa&apiKey=6a363f5724254353b5a4d5632bd23157"));
  List articles = json.decode(response.body)["articles"];

  return articles.map((data) => Article.fromData(data)).toList();
}
