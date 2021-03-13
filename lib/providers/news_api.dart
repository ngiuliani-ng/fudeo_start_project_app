import 'dart:async';
import 'dart:convert';
import 'package:fudeo_start_project_app/providers/config.dart';
import 'package:http/http.dart' as http;

import 'package:fudeo_start_project_app/models/article.dart';

/// API: https://newsapi.org/docs/endpoints/top-headlines
Future<List<Article>> topHeadlines() async {
  final apiKey = Config().apiKey;

  final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=ansa&apiKey=$apiKey"));
  List articles = json.decode(response.body)["articles"];

  return articles.map((data) => Article.fromData(data)).toList();
}

/// API: https://newsapi.org/docs/endpoints/everything
Future<List<Article>> everything() async {
  final apiKey = Config().apiKey;

  final response = await http.get(Uri.parse("https://newsapi.org/v2/everything?sources=ansa&apiKey=$apiKey"));
  List articles = json.decode(response.body)["articles"];

  return articles.map((data) => Article.fromData(data)).toList();
}
