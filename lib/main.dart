// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Components
import 'package:vacation_project/components/NewsTile.dart';
import 'package:vacation_project/components/NewsItem.dart';
import 'package:vacation_project/models/News.dart';

// Screens
import 'views/Sports.dart';
import 'views/Tech.dart';
import 'views/Finance.dart';

// Controllers
import 'controllers/mainNews.dart';
import 'package:vacation_project/controllers/topNews.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  final mainNewsController controller = Get.put(mainNewsController());
  final topNewsController topController = Get.put(topNewsController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text("NEWzic",      
          style: const TextStyle(fontFamily: "Kollektif", color: Colors.cyan,fontWeight: FontWeight.w800,letterSpacing: 1.5, fontSize: 24),),
          //centerTitle: true,
          actions: [IconButton(onPressed: () => Get.snackbar("Developer Info", "Developed with ❤ by Nitin Garg",backgroundColor: Colors.cyan), icon: Icon(Icons.info))],
        ),
        body: Column(
          children: [

            Container(
              decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(const Radius.circular(12))),
              margin: const EdgeInsets.fromLTRB(30, 15, 30, 5),
              padding: const EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                const Icon(Icons.newspaper,size: 40,color:Colors.cyan,),

                IconButton(onPressed: () => Get.to(()=>Sports(),transition: Transition.leftToRight),
                iconSize: 40,
                color: Colors.black,
                icon: const Icon(Icons.sports_cricket),
                ),

                IconButton(onPressed: () => Get.to(()=>Finance(),transition: Transition.leftToRight),
                iconSize: 40,
                color: Colors.black,
                icon: const Icon(Icons.currency_bitcoin_sharp),
                ),

                IconButton(onPressed: () => Get.to(()=>Tech(),transition: Transition.leftToRight),
                iconSize: 40,
                color: Colors.black,
                icon: const Icon(Icons.computer_sharp),

                ),
                
              ],),
            ),
            SizedBox(
              height: 200,
              child: Obx(() =>
              topController.allNews.isNotEmpty && topController.allNews[0]!=null?ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topController.allNews.length,
                itemBuilder: ((context, index) => NewsItem(topController.allNews[index],index))):SizedBox(width: 200, child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: CircularProgressIndicator(),
                )),)
            ),
            Expanded(child: 
              Obx(() => 
              controller.allNews.isNotEmpty && controller.allNews[0]!=null?ListView.builder(
                itemCount: controller.allNews.length,
                itemBuilder: ((context, index) => NewsTile(controller.allNews[index]))):Text("Loading..."))
              )
          ],
        ),
        ),
    );
  }

}