import 'dart:convert';

import'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiAlbum extends StatefulWidget {
  const ApiAlbum({super.key});

  @override
  State<ApiAlbum> createState() => _ApiAlbumState();
}

class _ApiAlbumState extends State<ApiAlbum> {
  List<AlbumModal> albumList= [];

  Future<List<AlbumModal>> getAlbum () async{

    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200)
      {
        for(Map index in data)
          {
            AlbumModal albumModal = AlbumModal(
                userId: index['userId'],
                id: index['id'],
                title: index['title']);

            albumList.add(albumModal);
          }
        return albumList;
      }
    else
    {
      return albumList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Rest Api ALBUMS'),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getAlbum(),
                builder: (context,AsyncSnapshot<List<AlbumModal>> snapshot)
                {
                  if(!snapshot.hasData)
                    {
                      return const Center(child:  CircularProgressIndicator());
                    }
                  else{
                    return ListView.builder(
                        itemCount: albumList.length,
                        itemBuilder: (context,index)
                        {
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              subtitle: Text(snapshot.data![index].title.toString()),
                              title: Text(snapshot.data![index].userId.toString()),
                              leading: CircleAvatar(
                                backgroundColor: Colors.green.shade50,
                                child: Center(
                                  child: Text(snapshot.data![index].id.toString()),
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  }

                }
            ),
          )
        ],
      )
    );
  }
}

class AlbumModal{
  int userId,id;
  String title;

  AlbumModal({required this.userId,required this.id,required this.title});
}
