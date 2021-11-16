import 'dart:convert';

import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news =[];
  
  Future<void> getNews() async{
    String url="https://newsapi.org/v2/everything?q=tesla&from=2021-10-16&sortBy=publishedAt&apiKey=23c1c486b0114159bd312c801ae29ffe";
    
    var response = await http.get(Uri.parse(url));
    
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            //author: element['author'],
            title: element['title'],
            description: element['description'], 
            url: element['url'],         
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
          );
          news.add(articleModel);
        }

      });
    }


  }

}