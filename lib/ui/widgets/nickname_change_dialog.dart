import 'package:flutter/material.dart';
import 'package:timetracker/constants/app_themes.dart';

class NickNameChangeDialog extends StatefulWidget{
  @override
  _NickNameChangeDialogState createState() => _NickNameChangeDialogState();
}

class _NickNameChangeDialogState extends State<NickNameChangeDialog>{
  TextEditingController? nicknameController;
  FocusNode? focusNode;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nicknameController = TextEditingController();
    focusNode = FocusNode();

  }




  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('닉네임 변경',style: AppThemes.textTheme.headline2,),),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child:  Text('변경하실 닉네임을 입력해 주세요.',style: AppThemes.textTheme.bodyText1,),),
          Container(
            width: 400,
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: nicknameController,
            ),
          ),
          Row(
            children: [
              Image.asset('assets/icon/checked.png',width: 40,height: 40,fit: BoxFit.cover,)
            ],
          )
        ],
      ),
    );
  }

}