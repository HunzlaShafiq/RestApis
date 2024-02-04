import 'dart:convert';

import'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiToDo extends StatefulWidget {
  const ApiToDo({super.key});

  @override
  State<ApiToDo> createState() => _ApiToDoState();
}

class _ApiToDoState extends State<ApiToDo> {
  var data;
  Future<void> getToDo () async{
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if(response.statusCode==200)
      {
        data = jsonDecode(response.body.toString());
      }
    else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Rest Api TODOS'),
          backgroundColor: Colors.tealAccent,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getToDo(),
                  builder: (context,snapshot)
                  {
                    if(snapshot.connectionState==ConnectionState.waiting)
                    {
                      return const Center(child:  CircularProgressIndicator());
                    }
                    else{
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context,index)
                          {
                            return Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                subtitle: Text(data[index]['title'].toString()),
                                title: Text(data[index]['userId'].toString()),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green.shade50,
                                  child: Center(
                                    child: Text(data[index]['id']),
                                  ),
                                ),
                                trailing: data[index]['completed']==true ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank),
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
