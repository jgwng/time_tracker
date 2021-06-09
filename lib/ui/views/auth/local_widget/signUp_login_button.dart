import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetracker/constants/app_themes.dart';

class SignUpLoginButton extends StatelessWidget{
  final String? title;
  final double? width;
  final double? height;
  final VoidCallback? function;
  final Color? color;
  SignUpLoginButton({this.title,this.function,this.height,this.width,this.color});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4.0)
      ),
      child: Row(
        children: [
          SizedBox(width: 50,
            height: 50,child: Container(color: Colors.green,),),
          Expanded(child:
          Padding(
            padding: EdgeInsets.only(right: 20),
            child:Text(title!,style: AppThemes.textTheme.headline2!.copyWith(
              color: Colors.white,
            ),textAlign: TextAlign.center,),
          ),)
        ],
      ),
    );
  }

}