import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapis/Models/PostModal.dart';

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  State<ApiIntegration> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {

  List<PostModal> postList =[];

  Future<List<PostModal>> restapi () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data =jsonDecode(response.body.toString());

    if(response.statusCode==200)
      {
        postList.clear();
        for(Map i in data)
          {
            postList.add(PostModal.fromJson(i));
          }
        return postList;
      }
    else
      {
        return postList;
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Rest Api POSTS"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: restapi(),
                builder: (context,snapshot)
                {
                  if(!snapshot.hasData)
                    {
                      return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ));
                    }
                  else
                    {
                      return ListView.builder(
                          itemCount: postList.length,
                          itemBuilder: (context,index){
                            return Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'ID: '+postList[index].id.toString(),
                                  ),
                                  const SizedBox(height: 15,),
                                  Text('User ID: '+postList[index].userId.toString()),
                                  const SizedBox(height: 15,),
                                  Text('Title: '+postList[index].title.toString()),
                                  const SizedBox(height: 15,),
                                  Text('Body: '+postList[index].body.toString()),
                                ],
                              ),
                            );
                          },
                      );
                    }
                }
            ),
          )
        ],
      ),
    );
  }
}
