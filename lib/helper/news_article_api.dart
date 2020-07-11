import 'dart:convert';

import 'package:tech_two_stop/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsArticle {
  List<ArticleModel> articles = [];

  Future<void> getArticles() async {
    String url = "https://tech2stop.com/wp-json/wp/v2/posts";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    jsonData.forEach((element) {
      if (element['id'] != null &&
          element['jetpack_featured_media_url'] != null) {
        ArticleModel articleModel = ArticleModel(
          title: element['title']['rendered'],
          description: element['excerpt']['rendered'],
          imageUrl: element['jetpack_featured_media_url'],
          dateTime: element['date'],
          url: element['link'],
        );

        articles.add(articleModel);
      }
    });
  }
}

class CategoryNewsArticle {
  List<ArticleModel> categoryNews = [];

  Future<void> getCategoryNews(int id) async {
    String url = "https://www.tech2stop.com/wp-json/wp/v2/posts?categories=$id";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    jsonData.forEach((element) {
      if (element['id'] != null &&
          element['jetpack_featured_media_url'] != null) {
        ArticleModel articleModel = ArticleModel(
          title: element['title']['rendered'],
          description: element['excerpt']['rendered'],
          imageUrl: element['jetpack_featured_media_url'],
          dateTime: element['date'],
          url: element['link'],
        );

        categoryNews.add(articleModel);
      }
    });
  }
}