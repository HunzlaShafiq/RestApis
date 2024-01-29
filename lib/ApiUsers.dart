import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restapis/Models/UsersModal.dart';
import 'package:http/http.dart' as http;

class ApiUsers extends StatefulWidget {
  const ApiUsers({super.key});

  @override
  State<ApiUsers> createState() => _ApiUsersState();
}

class _ApiUsersState extends State<ApiUsers> {
  List<UsersModal> userList= [];
  Future<List<UsersModal>> getUsers () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data =jsonDecode(response.body.toString());
    if(response.statusCode==200)
      {
        for(Map i in data)
          {
            userList.add(UsersModal.fromJson(i));
          }
        return userList;
      }
    else
      {
        return userList;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Rest Api USERS'),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      body:Expanded(
        child: FutureBuilder(
            future: getUsers(),
            builder: (context,snapshot){
              if(!snapshot.hasData)
                {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.tealAccent,
                    ),
                  );
                }
              else
                {
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: Column(
                            children: [
                              Text(userList[index].address!.city.toString())
                            ],
                          ),
                        );
                      }
                  );
                }

            }
        ),
      ),
    );
  }
}
