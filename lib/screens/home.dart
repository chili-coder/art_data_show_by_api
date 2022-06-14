import 'dart:convert';

import 'package:class_test/model/artmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<ArtModel>list=[];
  String link="https://picsum.photos/v2/list?fbclid=IwAR2qk2kE60PcFr1S3OdDKwH9v6bhfWzmIaByJTvViW2iVnLMtDC4Lg7IyeI";

  fechData() async{
    var responce= await http.get(Uri.parse(link));
    print("starts code is${responce.statusCode}");
    if(responce.statusCode==200){
      final item= jsonDecode(responce.body);
      for(var data in item["exercises"]){
        ArtModel artModel =ArtModel(
            id: data["id"],
           author: data["author"],
            downloadUrl: data["download_url"]


        );

        setState(() {
          list.add(artModel);
        });
      }
      print("total lenght is${list.length}");
    } else{

    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("My Artwork"),
        leading: Row(
          children: [
            Icon(Icons.settings),
            Icon(Icons.api_rounded),
          ],
        ),
        actions: [
         Text("Share")
        ],
      ),
      body: GridView.builder(
          itemCount:list.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            return  Container(
              child: Column(
                children: [
                  Expanded(child: Stack(
                    children: [
                      Image.network("${list[index].downloadUrl}",
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,),
                      Positioned(
                          bottom: 10,
                          left: 5,
                          right: 5,
                          child: Center(child: Text("${list[index].author}",style: TextStyle(fontSize: 24,color: Colors.white),))),
                    ],
                  ))
                ],
              ),
            );
          }
      )

    );
  }
}
