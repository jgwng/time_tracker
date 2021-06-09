import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetracker/ui/widgets/standard_button.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:140,),
            Image.asset('assets/images/auth/stopwatch.png'),
            SizedBox(height: 20,),
            Text('EVON'),
            SizedBox(height:80),
            Text('Discover upcoming events\nnear you',textAlign: TextAlign.center,),
            SizedBox(height: 150,),
            StandardButton(title : '로그인하기',function : (){}),
            SizedBox(height:20),
            StandardButton(title : '회원가입', function : () {}),
            SizedBox(height:50),
          ],
        ),
      )
    );
  }

}