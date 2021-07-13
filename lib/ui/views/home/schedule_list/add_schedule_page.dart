import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timetracker/constants/app_themes.dart';
import 'package:timetracker/service/bottom_sheet/bottom_sheet.dart';
import 'package:timetracker/ui/widgets/app_bar/home_app_bar.dart';
import 'package:timetracker/ui/widgets/standard_button.dart';
import 'package:timetracker/utils/unfocus_textField.dart';

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

    titleNode = FocusNode();
    contentNode = FocusNode();
    print('initState');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(),
      body: GestureDetector(
        onTap : () => unFocus(context),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              scheduleTextField('제목'),
              scheduleTextField('간단 메모'),
              Row(
                children: [
                  startNEndTime('시작 시간'),
                  startNEndTime('종료 시간')
                ],
              ),
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('요일 설정',style: AppThemes.textTheme.subtitle1),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            firstAlarmSet = !firstAlarmSet;
                          });
                        },
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
                              Text('단일 알람',style: AppThemes.textTheme.bodyText2,)
                            ]
                        ),
                      )
                    ],),

                  SizedBox(height: 20,),
                  IgnorePointer(
                    ignoring: false,
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (ctx,i) => SizedBox(width: 10,),
                        itemBuilder: (ctx,i) => alarmDayItem(i),
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30,),

              alarmNotification(30),


              alarmNotification(10),


            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: StandardButton(
          color: AppThemes.mainColor,
          function: (){},
          title : '계획 추가하기'
        ),
      ),
    );
  }

  Widget scheduleTextField(String title){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20,bottom: 10),
          child:Text(title,style: AppThemes.textTheme.subtitle1,),
        ),
        Container(
          alignment: Alignment.center,
          height:50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
              controller: (title == '제목') ? titleController : contentController,
              focusNode:(title == '제목') ? titleNode : contentNode,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
        ),
      ],
    );
  }


  Widget alarmDayItem(int index){
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: AppThemes.mainColor)
      ),
      child: Text(dayList[index],style: AppThemes.textTheme.headline2,),
    );
  }

  Widget startNEndTime(String title){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment : CrossAxisAlignment.start,
        children: [
          Padding(
            padding : EdgeInsets.only(top:20,bottom: 10),
            child: Text(title,style: AppThemes.textTheme.subtitle1)
          ),
          GestureDetector(
              onTap: () async{
                var result = await onStartNEndTimePickerBottomSheet(context,title);
                print(DateFormat('HH:mm:ss').format(result!));
              },
              child : Container(
                width: 80,
                alignment: Alignment.center,
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('2020'),
              )
          )
        ],
      ),
    );
  }

  Widget alarmNotification(int time){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          Text('시작 $time분전 알림 설정',style: AppThemes.textTheme.bodyText1,),
          CupertinoSwitch(
            value: firstAlarmSet,
            onChanged: (value) async {
              setState(() {
                firstAlarmSet = !firstAlarmSet;
              });
            },
            activeColor:  AppThemes.pointColor,
          )
        ],),
    );
  }

}