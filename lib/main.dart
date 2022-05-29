import 'package:flutter/material.dart';
import 'package:my_camera_app/HomePage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'My Camera App',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.teal,
      ),
      home:HomePage()
    );
  }
}