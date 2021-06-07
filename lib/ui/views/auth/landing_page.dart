import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            Image.asset('assets/images/auth/stopwatch.png'),
            SizedBox(height:10,),
            Text('EVON'),
            SizedBox(height:80),
            Text('Discover upcoming events\nnear you',textAlign: TextAlign.center,),
            SizedBox(height: 80,),
            landingButton('로그인하기',(){},context),
            SizedBox(height:50),
            landingButton('회원가입', () { },context)
            


          ],
        ),
      )
    );
  }

  Widget landingButton(String title,VoidCallback function,BuildContext context){
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: MediaQuery.of(context).size.width*0.75, height: 50),

        child: ElevatedButton(
          child: Text(title),
          onPressed: function,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20 ))),
        ));
  }



}