import 'package:class_test/model/artmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
  DisplayPage({Key? key,this.artModel}) : super(key: key);

  ArtModel? artModel;
  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Image.network("${widget.artModel!.downloadUrl}",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,),

          Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Center(child: Text("${widget.artModel!.author}",style: TextStyle(fontSize: 30,color: Colors.white),))),

        ],
      ),

    );
  }
}
