import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text('CATCHTIME',style: TextStyle(fontFamily: 'Staatliches',fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
        centerTitle: true, elevation: 0,
    );
  }
}