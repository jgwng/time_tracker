import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetracker/constants/app_themes.dart';

class StandardButton extends StatelessWidget{
  final String? title;
  final double? width;
  final double? height;
  final VoidCallback? function;
  final Color? color;
  StandardButton({this.title,this.function,this.height,this.width,this.color});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: width ?? MediaQuery.of(context).size.width, height: height ?? 50),
        child: ElevatedButton(
          child: Text(title!),
          onPressed: function,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppThemes.mainColor),
              textStyle: MaterialStateProperty.all(AppThemes.textTheme.headline2!.copyWith(
                color: Colors.white
              ))),
        ));
  }
  
}