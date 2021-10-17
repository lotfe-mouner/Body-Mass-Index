import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white,size: 25),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 45, fontWeight: FontWeight.w800,color: Colors.white),
          headline2: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
          bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
        ),
      ),
      home: MyHomePage()
      //Result(age: 22, result: 22, isMale: true),
    );
  }
}
