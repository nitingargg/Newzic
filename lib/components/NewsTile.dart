import 'package:flutter/material.dart';
import "package:get/get.dart";
import '../views/NewsDesc.dart';
import 'package:intl/intl.dart';

// Models
import '../models/News.dart';

class NewsTile extends StatelessWidget{

  late News news;

  NewsTile(News news){
    this.news=news;
    }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> NewsDesc(news.title!,news.imgUrl!,news.content!)),
      child: SizedBox(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white,Color.fromARGB(200, 251, 251, 251)],begin: Alignment.topLeft,)
          ,borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children: [
            
            Text(news.title.toString(),
            style: TextStyle(fontFamily: "Kollektif",color: Colors.black,fontSize: 16,height: 1.2),),
          SizedBox(height:15,),
          Text(DateFormat.yMMMMd('en_US').format(news.date!),style: TextStyle(fontFamily: "Kollektif",color: Colors.cyan),)
          ]),
        ),      
      ),
    );
  }



}
