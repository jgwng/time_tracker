import 'package:flutter/material.dart';
import 'package:timetracker/ui/home/home_page.dart';
import 'package:timetracker/ui/views/auth/login_page.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        // primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,


      ),

      home: HomePage(),
    );
  }
}