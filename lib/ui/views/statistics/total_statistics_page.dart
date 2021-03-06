import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/constants/app_themes.dart';
import 'package:timetracker/ui/views/statistics/detail_chart_page.dart';
import 'package:timetracker/ui/views/statistics/report_chart_painter.dart';
import 'package:timetracker/ui/widgets/app_bar/home_app_bar.dart';

class TotalReportPage extends StatefulWidget{
  @override
  _TotalReportPageState createState() => _TotalReportPageState();
}

class _TotalReportPageState extends State<TotalReportPage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:CustomAppBar(),
     body :Column(
       children: [
         SizedBox(height: 30,),
         Text('WELCOME BACK, YOO YA HO',style: AppThemes.textTheme.subtitle2!.copyWith(color: Colors.grey),),
         SizedBox(height: 15,),
         Text('Your score is',style : AppThemes.textTheme.headline2!.copyWith(fontSize: 26,fontWeight: FontWeight.w400),),
         SizedBox(height: 10,),
         Text('Good',style : AppThemes.textTheme.headline2!.copyWith(fontSize: 28,fontWeight: FontWeight.w700)),
         SizedBox(height: 10,),
         Stack(
           alignment: Alignment.center,
           children: [
             Center(
                 child : Container(
                   width: 300,
                   height: 280,
                   color: Colors.transparent,
                   child: Center(
                       child: CustomPaint(
                           painter: WheelCircle(
                               wheelSize: 265,
                               longNeedleHeight: 50,
                               shortNeedleHeight: 50,
                               context: context
                           ))),
                 )
             ),
             Column(
               children: [
                 SizedBox(height: 100,),
                 Text('89',style: AppThemes.textTheme.headline2!.copyWith(fontSize: 40),),
                 Text('out of 100',style: AppThemes.textTheme.subtitle2!.copyWith(color: Colors.grey)),
                 SizedBox(height: 80,),
                 Text('Your score is based on the last',style : AppThemes.textTheme.subtitle2),
                 SizedBox(height: 5,),
                 Text('16 Transactions')
               ],
             )
           ],
         ),
         SizedBox(height: 60,),
         Container(
             height:  60,
             width: double.infinity,
             padding:EdgeInsets.symmetric(horizontal: 20) ,
             child:  TextButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color>(AppThemes.mainColor),
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(6.0),
                     )
                 ),
                 elevation: MaterialStateProperty.all<double>(0.0),
               ),
               onPressed: () async {
                 Navigator.push(context, MaterialPageRoute(builder: (_) => DetailChartPage()));


               },
               child: Text('?????? ??????',style: AppThemes.textTheme.headline1!.copyWith(color: Colors.white)),
             )
         )



       ],
     ),
   );
  }
  
}