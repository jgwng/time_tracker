import 'package:flutter/material.dart';

class AppThemes{


  static Color mainColor = Colors.lightBlue[200]!;
  static const Color pointColor = Color.fromRGBO(242,203,5,1.0);
  static const Color pointColor2 = Color.fromRGBO(242, 159, 5, 1.0);
  static const Color textColor = Color.fromRGBO(112,112,112,1.0);
  static const Color inActiveColor = Color.fromRGBO(174, 174, 174, 1.0);

  AppThemes._();
  static const TextTheme textTheme = TextTheme(
    button: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: "AppleSDGothicNeo", color: Colors.white),
    headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, fontFamily: "SpoqaHanSansNeo", color: Colors.black),
    headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: "SpoqaHanSansNeo", color: Colors.black),
    subtitle1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: "SpoqaHanSansNeo", color: Colors.black),
    subtitle2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: "SpoqaHanSansNeo", color: Colors.black),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: "SpoqaHanSansNeo", color: Colors.black),
    bodyText2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, fontFamily: "SpoqaHanSansNeo", color: Colors.black),
  );

}