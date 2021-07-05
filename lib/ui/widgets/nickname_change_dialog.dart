import 'package:flutter/material.dart';
import 'package:timetracker/constants/app_themes.dart';
import 'package:timetracker/ui/widgets/standard_button.dart';
import 'package:timetracker/utils/unfocus_textField.dart';

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
  void dispose(){
    super.dispose();
    nicknameController!.dispose();
    focusNode!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => unFocus(context),
        child: Container(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('닉네임 변경',style: AppThemes.textTheme.headline2,),),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child:  Text('변경하실 닉네임을 입력해 주세요.',style: AppThemes.textTheme.bodyText1!.copyWith(
                    color: Colors.grey
                ),),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      controller: nicknameController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.create_rounded,size: 30,)
                      ),
                    ),
                  ),
                  Container(
                      width: 100,
                      height: 40,
                      child:ElevatedButton(
                        child: Text('중복확인'),
                        onPressed: (){},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.lightBlue[200]),
                            textStyle: MaterialStateProperty.all(AppThemes.textTheme.subtitle2!.copyWith(
                                color: Colors.white
                            ))),
                      )
                  )
                ],
              ),
             Container(
               padding: EdgeInsets.only(top: 30,bottom: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset('assets/icon/checked.png',width: 20,height: 20,fit: BoxFit.cover,),
                   SizedBox(width: 10,),
                   Text('사용 가능한 닉네임입니다!',style: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.blue),)
                 ],
               ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('취소'),
                        onPressed: (){},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppThemes.mainColor),
                            textStyle: MaterialStateProperty.all(AppThemes.textTheme.headline2!.copyWith(
                                color: Colors.white
                            ))),
                      ),
                    ),
                    SizedBox(width: 30,),
                    Expanded(
                      child: ElevatedButton(
                        child: Text('변경하기'),
                        onPressed: (){},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppThemes.mainColor),
                            textStyle: MaterialStateProperty.all(AppThemes.textTheme.headline2!.copyWith(
                                color: Colors.white
                            ))),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

}