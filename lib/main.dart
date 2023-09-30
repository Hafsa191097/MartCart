import 'package:MartCart/routes.dart';
import 'package:flutter/material.dart';

import 'Auth/AuthScreen.dart';
import 'Constants/_Globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mart Cart',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          appBarTheme:const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(        
            color: Colors.black,
          ),
        ),
        colorScheme:const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute:(settings) => generateRoutes(settings),
      home: const authScreen(),
      
    );
  }
}
