import 'dart:convert';

import 'package:dailynews/model/newsmodel.dart';
import 'package:http/http.dart';

class News {

  // save json data inside this
  List<ArticleModel> datatobesavedin = [];


  Future<void> getNews() async {

    var response = await get('http://newsapi.org/v2/top-headlines?country=us&apiKey=52489cf346804f2eb180b8e34528aa26');
    var jsonData = jsonDecode(response.body);


    if (jsonData['status'] == 'ok') {

      jsonData['articles'].forEach((element) {


        if (element['urlToImage']!=null && element['description']!=null) {

          // initliaze our model class

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
          );


          datatobesavedin.add(articleModel);


        }


      });

    }




  }

}

// fetching news by  category
class CategoryNews {

  List<ArticleModel> datatobesavedin = [];


  Future<void> getNews(String category) async {

    var response = await get('http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=52489cf346804f2eb180b8e34528aa26');
    var jsonData = jsonDecode(response.body);


    if (jsonData['status'] == 'ok') {

      jsonData['articles'].forEach((element) {


        if (element['urlToImage']!=null && element['description']!=null) {

          // initliaze our model class

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
          );


          datatobesavedin.add(articleModel);


        }


      });

    }




  }

}