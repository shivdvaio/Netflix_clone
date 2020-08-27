import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'package:flutter_netflix_responsive_ui/Screens/nav_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Netflix UI",
    
      theme: ThemeData(primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Colors.black,
      ),
      home: NavScreeen(),

    );
  }
}