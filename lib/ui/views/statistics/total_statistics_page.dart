import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/ui/views/statistics/report_chart_painter.dart';

class TotalReportPage extends StatefulWidget{
  @override
  _TotalReportPageState createState() => _TotalReportPageState();
}

class _TotalReportPageState extends State<TotalReportPage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body : Center(
       child: Container(
         width: 300,
         height: 180,
         alignment: Alignment.center,
         child: CustomPaint(
           painter: WheelCircle(
             context: context,
            longNeedleHeight: 20,
           shortNeedleHeight: 20,
           wheelSize: 300),
         ),
       ),
     )
   );
  }
  
}