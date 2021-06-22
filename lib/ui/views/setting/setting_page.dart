import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/constants/app_themes.dart';

class SettingPage extends StatefulWidget{
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>{
  List<String> crmMenuList = ['이메일 문의','자주묻는 질문','공지사항'];
  List<String> settingList = ['다크모드 설정','마케팅 수신 동의','언어 설정'];

  bool setDarkMode = false;
  bool setMarketingAgree = false;


  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar : AppBar(
         backgroundColor: Colors.white,
         title: Text('CATCHTIME',style: TextStyle(fontFamily: 'Staatliches',fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
         centerTitle: true, elevation: 0,
       ),
     body: SingleChildScrollView(
       padding: EdgeInsets.symmetric(horizontal: 24),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment : CrossAxisAlignment.start,
         children: [
           SizedBox(height: 20,),
           Container(
             height: 80,
             decoration: BoxDecoration(
               color: Colors.grey[200],
               borderRadius: BorderRadius.circular(8.0)
             ),
             child: ListTile(
               leading:Container(
                 width: 45,
                 height: 45,
                 alignment: Alignment.center,
                 child: Image.asset('assets/images/setting/user.png',fit: BoxFit.cover,),
               ),
               title: Text('아무개12345678님',style: AppThemes.textTheme.bodyText1,),
               subtitle: Text('탭하여 닉네임을 변경할 수 있어요!',style: AppThemes.textTheme.bodyText1,),
             ),
           ),

           SizedBox(height: 20,),
           Text('설정',style: AppThemes.textTheme.subtitle1,),
           SizedBox(height: 20,),
           Container(
             decoration: BoxDecoration(
                 color: Colors.indigo[50],
                 borderRadius: BorderRadius.circular(8.0)
             ),
             child: ListView.separated(
               itemBuilder: (ctx,i) => settingListItem(i),
               itemCount: settingList.length,
               shrinkWrap: true,
               separatorBuilder: (ctx,i) => Divider(height: 1,thickness: 1,color: Colors.grey,),
             ),
           ),
           SizedBox(height: 40,),
           Text('고객센터',style: AppThemes.textTheme.subtitle1,),
           SizedBox(height: 20,),
           Container(
             decoration: BoxDecoration(
               color: Colors.indigo[50],
               borderRadius: BorderRadius.circular(8.0)
             ),
             child: ListView.separated(
               itemBuilder: (ctx,i) => itemList(i),
               itemCount: crmMenuList.length,
               shrinkWrap: true,
               separatorBuilder: (ctx,i) => Divider(height: 1,thickness: 1,color: Colors.grey,),
             ),
           )
           
         ]
       ),
     ),
   );
  }

  Widget itemList(int index){
    return Container(
      height: 60,
      child: ListTile(
        title: Text(crmMenuList[index],style: AppThemes.textTheme.subtitle2,),
      ),
    );
  }

  Widget settingListItem(int index){
    return Container(
      height : 60,
      child: ListTile(
        onTap: (index != 2) ? null : (){print('aa');},
        title: Text(settingList[index],style: AppThemes.textTheme.subtitle2,),
        trailing: (index != 2) ? CupertinoSwitch(value: (index == 0) ? setDarkMode : setMarketingAgree,
          onChanged: (bool value){
          setState(() {
            (index == 0) ? setDarkMode = value : setMarketingAgree = value;
          });
          },) : null,
      ),
    );
  }




}