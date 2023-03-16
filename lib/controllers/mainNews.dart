import 'dart:convert';

import 'package:get/get.dart';
import '../models/News.dart';
import 'package:http/http.dart' as http;


class mainNewsController extends GetxController{

  List allNews = [].obs;


  @override
  void onInit(){
    super.onInit();
    getData();
  }

  void getData() async{
    var data = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=16434e6fbb3f43b08cb3519157a2a2a3"));
    if(data.statusCode==200){
      var allJson = json.decode(data.body);
      List articles = allJson["articles"];
      articles.forEach((element) { 
        News n = new News();
        n.fromJSON(element);
        allNews.add(n);
      });
    }
  }


}