import 'package:flutter/material.dart';
import 'package:vacation_project/components/NewsTile.dart';
import 'package:vacation_project/controllers/financeNews.dart';
//import 'package:vacation_project/models/News.dart';
import 'package:get/get.dart';

class Finance extends StatelessWidget{

  var ct = Get.put(financeNewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finance News",style: TextStyle(fontFamily: "Kollektif"),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: Obx((() => ListView.builder(itemBuilder: (context, index) {
            return  NewsTile(ct.allNews[index]);
          }
          ,itemCount: ct.allNews.length,
        )
      ))));
  }

}