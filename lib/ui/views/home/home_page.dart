import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetracker/constants/app_themes.dart';
import 'package:timetracker/ui/widgets/app_bar/home_app_bar.dart';
import 'package:timetracker/ui/widgets/state_progress_circle.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  bool changeState = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: Colors.black)
              ),
              child: Column(
                children: [
                  Container(
                    alignment : Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 13,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('현재 계획 ',textAlign: TextAlign.left,
                        style: AppThemes.textTheme.bodyText1!.copyWith(fontSize: 15),),
                      Text('코딩하기',textAlign: TextAlign.left,
                        style: AppThemes.textTheme.bodyText1!.copyWith(fontSize: 15),)
                    ],),),
                  Divider(height: 1,color: Colors.grey,thickness: 1,),
                  Padding(
                    padding: EdgeInsets.only(left: 15,right: 15,top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Text('시작 지점',style: AppThemes.textTheme.subtitle2,),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(height: 1,thickness: 2,color: AppThemes.mainColor,),),
                              Text('10 : 00',style: AppThemes.textTheme.subtitle2,),
                            ],
                          ),
                        ),
                        CustomPaint(
                          painter: LevelProgressCircle(),
                          child: Container(
                            child: Column(
                              children: [
                                Text('56%',style: AppThemes.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w700),),
                                SizedBox(height: 5,),
                                Text('성취율',style: AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700),)
                              ],
                            ),
                          ),
                          foregroundPainter: LevelProgressArc(0.56),
                        ),
                        Container(
                          width: 80,
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Text('목표 지점',style: AppThemes.textTheme.subtitle2,),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(height: 1,thickness: 2,color: AppThemes.mainColor,),),
                              Text('10 : 00',style: AppThemes.textTheme.subtitle2,),




                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height:  80,
                            margin: EdgeInsets.only(top: 40),
                            padding:EdgeInsets.symmetric(horizontal: 10) ,
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
                              onPressed: () async {},
                              child: Text('측정 종료',style: AppThemes.textTheme.headline1!.copyWith(color: Colors.white)),
                            )
                        ),
                      ),
                      Expanded(
                        child: Container(
                            height:  80,
                            margin: EdgeInsets.only(top: 40),
                            padding:EdgeInsets.symmetric(horizontal: 10) ,
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
                              onPressed: () async {},
                              child: Text('계획 수정',style: AppThemes.textTheme.headline1!.copyWith(color: Colors.white)),
                            )
                        ),
                      ),
                    ],
                  )



                ],
              ),
            ),
            SizedBox(height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('오늘의 계획',style: AppThemes.textTheme.subtitle1,),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(6.0)
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        subtitle: Text('10:00 ~ 11:00',style: AppThemes.textTheme.bodyText1),
                        title: Text('개인 프로젝트',style: AppThemes.textTheme.subtitle2,),
                        trailing: Icon(Icons.ac_unit,size: 30,),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        subtitle: Text('10:00 ~ 11:00',style: AppThemes.textTheme.bodyText1),
                        title: Text('개인 프로젝트',style: AppThemes.textTheme.subtitle2,),
                        trailing: Icon(Icons.ac_unit,size: 30,),
                      ),
                      Container(
                          height:  50,
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 10),
                          padding:EdgeInsets.symmetric(horizontal: 10) ,
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
                            onPressed: () async {},
                            child: Text('전체 보기',style: AppThemes.textTheme.headline1!.copyWith(color: Colors.white)),
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20,)
          ],

        ),
      ),
    );
  }

}