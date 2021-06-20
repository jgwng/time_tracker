import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:timetracker/constants/app_themes.dart';
import 'package:timetracker/ui/views/home/schedule_list/add_schedule_page.dart';

class ScheduleListPage extends StatefulWidget{
  @override
  _ScheduleListPageState createState() => _ScheduleListPageState();
}

class _ScheduleListPageState extends State<ScheduleListPage>{
  DateTime? selectedTime;

  @override
  void initState(){
    super.initState();
    selectedTime = DateTime.now();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('CATCHTIME',style: TextStyle(fontFamily: 'Staatliches',fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
        centerTitle: true, elevation: 0,
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async{
                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101));
                if (picked != null && picked != DateTime.now())
                  setState(() {
                   selectedTime = picked;
                  });
              },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical:10),
                  color: Colors.grey[200],
                  alignment: Alignment.centerLeft ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:20),
                      Text(DateFormat('yyyy.MM.dd').format(selectedTime!),style: AppThemes.textTheme.bodyText1,),
                      Icon(Icons.arrow_drop_down,size:20),
                    ],
                ),
                  ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment : MainAxisAlignment.start,
                crossAxisAlignment : CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    subtitle: Text('10:00 ~ 11:00',style: AppThemes.textTheme.bodyText1),
                    title: Text('개인 프로젝트',style: AppThemes.textTheme.subtitle2,),
                    trailing: Icon(Icons.ac_unit,size: 30,),
                  )
                ],
              ),
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddSchedulePage()));

        },
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add_rounded,size: 40,),
      ),
    );
  }

}