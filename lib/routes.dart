

import 'package:flutter/material.dart';
import 'package:restapis/ApiIntegration.dart';
import 'package:restapis/ApiPhotos.dart';
import 'package:restapis/Home.dart';

class RoutesName
{
 static const posts= 'Posts';
 static const images='Images';
 static const home='Home';
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
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Text('No page Route'),
          );
        });
    }
  }
}
