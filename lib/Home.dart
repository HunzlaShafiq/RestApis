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
        title: Text('Home'),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.posts);
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.blue,
                borderRadius: BorderRadius.circular(15)
              ),

              child: const Center(child: Text('POSTS')),
              
            ),
          ),

        ],
      ),
    );
  }
}
