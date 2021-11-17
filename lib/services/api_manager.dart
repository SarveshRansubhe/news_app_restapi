
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_restapi/models/newsinfo.dart';

class ApiManager {
  static var client = http.Client();
  static Future<NewsModel> getNews() async {
    

    // ignore: avoid_init_to_null
    var newsModel = null;

    try {
      var response = await client.get(Uri.http(
          'newsapi.org', "/v2/everything", {
        "domains": "wsj.com",
        "apiKey": "abc123likethis"
      }));
      

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        var newsModel = NewsModel.fromJson(jsonMap);
        return newsModel;
      }
    } catch  (exception){
      return newsModel;
    }
    return newsModel;
  }
}
