import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/constants/app_themes.dart';

class AddSchedulePage extends StatefulWidget{
  @override
  _AddSchedulePageState createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage>{
  TextEditingController? titleController;
  TextEditingController? contentController;

  FocusNode? titleNode;
  FocusNode? contentNode;


  bool firstAlarmSet = false;
  List<String> dayList = ['일','월','화','수','목','금','토'];
  @override
  void initState(){
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('CATCHTIME',style: TextStyle(fontFamily: 'Staatliches',fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
        centerTitle: true, elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          SizedBox(height: 20,),
          Text('제목'),
          SizedBox(height: 10,),
          TextField(
            controller: titleController,
          ),
          SizedBox(height: 20,),
          Text('간단 메모'),
          SizedBox(height: 10,),
          TextField(
            controller: contentController,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('시작 시간'),
                    SizedBox(height: 10,),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      color: Colors.grey[200],
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('2020'),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('시작 시간'),
                    SizedBox(height: 10,),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      color: Colors.grey[200],
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('2020'),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('요일 설정'),
                GestureDetector(
                  onTap: (){},
                  child: Row(
                      children : [
                        //체크박스 넣기
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Theme(
                              data: ThemeData(unselectedWidgetColor: AppThemes.mainColor),
                              child: Checkbox(value: firstAlarmSet, onChanged: (bool? value) {
                                setState(() {
                                  firstAlarmSet = !firstAlarmSet;
                                });
                              })),
                        ),
                        SizedBox(width: 20,),
                        Text('매일 설정')
                      ]
                  ),
                )
              ],),

              SizedBox(height: 20,),
              Container(
                height: 60,
                alignment: Alignment.center,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (ctx,i) => SizedBox(width: 10,),
                  itemBuilder: (ctx,i) => Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: AppThemes.mainColor)
                    ),
                    child: Text(dayList[i],style: AppThemes.textTheme.headline2,),
                  ),
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
          [
            Text('시작 30분전 알림 설정'),
            CupertinoSwitch(
              value: firstAlarmSet,
              onChanged: (value) async {
                setState(() {
                  firstAlarmSet = !firstAlarmSet;
                });
              },
              activeColor:  AppThemes.pointColor,
            )
            ],)

        ],
        ),
      ),
    );
  }

  





}