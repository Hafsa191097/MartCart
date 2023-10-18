import 'package:MartCart/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:MartCart/Auth/AuthScreen.dart';

Route<dynamic> generateRoutes(RouteSettings routesettings){
    switch(routesettings.name){
      case authScreen.routname:
        return MaterialPageRoute(settings: routesettings, builder: (_) => const authScreen() );
      case HomeScreen.routName:
        return MaterialPageRoute(settings: routesettings, builder: (_) => const HomeScreen() );
    
      default:
        return MaterialPageRoute(
          builder:(_)=> const Scaffold(
            body: Center(
              child: Text('Wrong Page Error 404!', style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.w800),),
            ),
          ),
        );
    }
}