

import 'package:flutter/material.dart';
import 'package:restapis/ApiAlbums.dart';
import 'package:restapis/ApiIntegration.dart';
import 'package:restapis/ApiPhotos.dart';
import 'package:restapis/ApiToDo.dart';
import 'package:restapis/ApiUsers.dart';
import 'package:restapis/Home.dart';

class RoutesName
{
 static const posts= 'Posts';
 static const images='Images';
 static const home='Home';
 static const users='Users';
 static const album='Album';
 static const todo='ToDo';
}

class Routes
{
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    switch(settings.name)
        {
      case RoutesName.posts:
        return MaterialPageRoute(builder: (context)=>const ApiIntegration());
      case RoutesName.images:
        return MaterialPageRoute(builder: (context)=>const ApiPhotos());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context)=>const Home());
      case RoutesName.users:
        return MaterialPageRoute(builder: (context)=>const ApiUsers());
      case RoutesName.album:
        return MaterialPageRoute(builder: (context)=>const ApiAlbum());
      case RoutesName.todo:
        return MaterialPageRoute(builder: (context)=>const ApiToDo());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Text('No page Route'),
          );
        });
    }
  }
}
