import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restapis/Models/PhotosModal.dart';
import 'package:http/http.dart' as http;

class ApiPhotos extends StatefulWidget {
  const ApiPhotos({super.key});

  @override
  State<ApiPhotos> createState() => _ApiPhotosState();
}

class _ApiPhotosState extends State<ApiPhotos> {
  List<PhotosModal> photoList =[];
  Future<List<PhotosModal>> getphotos  ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode==200)
      {
        for( Map i in data)
          {
            photoList.add(PhotosModal.fromJson(i));
          }
        return photoList;
      }
    else
      {
        return photoList;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Photos'),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      body: Expanded(
        child: FutureBuilder(
            future: getphotos(),
            builder: (context,snapshot){
              if(!snapshot.hasData)
                {
                  return const  Center(child: CircularProgressIndicator(color: Colors.blue,));
                }
              else
                {
                  return ListView.builder(
                      itemBuilder:(context,index){
                        return Card(
                            child: Column(
                                children: [
                            Image.network(photoList[index].thumbnailUrl.toString(),width: 150,height: 80,),

                                ]
                            )
                        );
                      }

              );
            }
            }
        ),
      )
    );
  }
}
