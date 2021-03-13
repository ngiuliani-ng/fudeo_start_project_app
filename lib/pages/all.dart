import 'package:flutter/material.dart';
import 'package:fudeo_start_project_app/models/article.dart';
import 'package:fudeo_start_project_app/providers/news_api.dart';

import 'article_detail.dart';

class AllPage extends StatelessWidget {
  Widget buildArticle(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(article: article),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            article.description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: everything(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );

          case ConnectionState.done:
            List<Article> articles = snapshot.data;
            return GridView.count(
              padding: EdgeInsets.all(16),
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: List.generate(
                articles.length,
                (index) {
                  return buildArticle(context, articles[index]);
                },
              ),
            );

          default:
            return Center(
              child: Icon(
                Icons.error_outline_rounded,
                size: 35,
              ),
            );
        }
      },
    );
  }
}
