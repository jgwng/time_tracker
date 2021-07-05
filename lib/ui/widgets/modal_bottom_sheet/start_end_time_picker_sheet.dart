import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:timetracker/constants/app_themes.dart';
import 'package:timetracker/ui/widgets/standard_button.dart';
class StartEndTimePickerSheet extends StatefulWidget {
  @override
  _StartEndTimePickerSheetState createState()=> _StartEndTimePickerSheetState();
}

class _StartEndTimePickerSheetState extends State<StartEndTimePickerSheet>{
  DateTime? dateTime;
  final initDate = DateFormat('yyyy-MM-dd').parse('2000-01-01');

  @override
  void initState() {
    super.initState();
    dateTime =DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: Color.fromRGBO(239, 240, 242, 1.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.16))),
                color: Colors.white
            ),
            padding: EdgeInsets.only(left: 28.0,top: 5),
            alignment: Alignment.centerLeft,
            height: 48,

            child:Text(
              '시작시간 설정하기', style:  AppThemes.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w400,color: const Color.fromRGBO(42, 42, 42, 1.0)),
            ),
          ),
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 40),
            color: Color.fromRGBO(239, 240, 242, 1.0),
            child: CupertinoDatePicker(
              initialDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0),
              minuteInterval: 10,
              maximumDate: DateTime.now(),
              backgroundColor: Colors.transparent,
              onDateTimeChanged: (value) {
                setState(() {
                  dateTime = value;
                });
              },
              mode: CupertinoDatePickerMode.time,

            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: StandardButton(
                    height: 48,
                    title: '취소',
                    function: () => Navigator.pop(context,null),

                  ),
                ),
                SizedBox(width:48),
                Expanded(
                  child: StandardButton(
                    height: 48,
                    title: '입력',
                    function: () => Navigator.pop(context,dateTime),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

}