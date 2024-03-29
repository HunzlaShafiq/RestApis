import 'package:flutter/material.dart';
import 'package:restapis/routes.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Home'),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
              'Click Buttons to Hit Particular REST API',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.teal,
              fontSize: 20
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.posts);
              },
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.teal,
                  borderRadius: BorderRadius.circular(15)
                ),

                child: const Center(child: Text(
                  'POSTS',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )),

              ),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.images);
              },
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: const Center(child: Text(
                  'IMAGES',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )),

              ),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.users);
              },
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: const Center(child: Text(
                  'USERS',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )),

              ),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.album);
              },
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: const Center(child: Text(
                  'ALBUM',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )),

              ),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.todo);
              },
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: const Center(child: Text(
                  'TODO',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )),

              ),
            ),
          ),

        ],
      ),
    );
  }
}
