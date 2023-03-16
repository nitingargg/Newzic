import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../views/NewsDesc.dart';
import '../models/News.dart';

class NewsItem extends StatelessWidget{

    late News news;
    late int cl;

    NewsItem(News news, int cl){
      this.news=news;
      this.cl=cl;
    }

    List<Color> list_cl = [Colors.cyan,Colors.amber,Colors.pink,Colors.greenAccent,Colors.redAccent];
  
    @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=>NewsDesc(news.title!,news.imgUrl!,news.content!)),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(news.imgUrl!),fit: BoxFit.fitWidth,opacity: 0.35),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
                 colors: [Colors.black, list_cl[cl]],
                begin: Alignment.topLeft,
                 end: Alignment.topRight,
            ),
        ),
        child: Text(news.title!,style: TextStyle(fontFamily: "Kollektif",fontSize: 16,height: 1.3)),
      ),
    );
    
  }

}