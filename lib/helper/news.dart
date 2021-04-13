import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

import '../secret.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
// class News {
//   List<ArticleModel> news = [];
//   Future<void> getNews() async {
//     String url =
//         "https://newsapi.org/v2/everything?q=tesla&from=2021-02-28&sortBy=publishedAt&apiKey=6b3d4669c79b437191500aa5add35fe6";

//     var response = await http.get(url);
//     var jsonData = jsonDecode(response.body);
//     if (jsonData['status'] == 'ok') {
//       jsonData["articles"].forEach((element) {
//         if (element["urlToImage"] != null && element['description'] != null) {
//           ArticleModel articleModel = ArticleModel(
//             title: element['title'],
//             author: element["author"],
//             description: element["description"],
//             url: element["url"],
//             urlToImage: element["urlToImage"],
//             content: element["content"],
//           );

//           news.add(articleModel);
//         }
//       });
//     }
//   }
// }
