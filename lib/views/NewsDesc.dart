import 'package:flutter/material.dart';

class NewsDesc extends StatelessWidget{

  late String head;
  late String img;
  late String desc;

  NewsDesc(String head, String img, String desc){
    this.head=head;
    this.img=img;
    this.desc=desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Description",style: TextStyle(fontFamily: "Kollektif"),),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
      children: [
      Text(head,
      style: TextStyle(fontFamily: "Kollektif",
      fontWeight: FontWeight.bold,
      fontSize: 24,
      height: 1.4),),
      Padding(
        padding: const EdgeInsets.fromLTRB(0,25,0,25),
        child: 
                Image.network(img)

        
        ),
      Text(desc,
      style: TextStyle(fontSize: 16,height: 1.3),)
      ],
    ));
    ;
  }


}