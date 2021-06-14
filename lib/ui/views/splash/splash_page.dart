import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:timetracker/ui/home/practice_page.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 3500), () async{
      // 5s over, navigate to a new page
      if(mounted)
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: Lottie.asset('assets/animations/clock_animation.json')
      )
    );
  }
  
}