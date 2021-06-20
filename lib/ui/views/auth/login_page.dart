import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetracker/ui/views/auth/local_widget/signUp_login_button.dart';
import 'package:timetracker/ui/widgets/custom_text_field.dart';
import 'package:timetracker/ui/widgets/standard_button.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  TextEditingController? emailController;
  TextEditingController? pwController;


  FocusNode? emailNode;
  FocusNode? pwNode;


  @override
  void initState(){
    super.initState();

    emailController = TextEditingController();
    pwController = TextEditingController();

    emailNode = FocusNode();
    pwNode = FocusNode();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus)
                currentFocus.unfocus();
            },child: buildBody())
    );
  }

  Widget buildBody(){
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 50,),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:100,),
            Image.asset('assets/images/auth/stopwatch.png'),
            SizedBox(height: 40,),
            CustomTFT(labelText: '이메일',controller: emailController!,focusNode: emailNode,),
            SizedBox(height: 5),
            CustomTFT(labelText: '비밀번호',controller: pwController!,focusNode: pwNode,),
            SizedBox(height: 10),
            StandardButton(title: '로그인', function: (){}),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: Divider(),
                ),
                SizedBox(
                  width: 40, child: Text('또는' , textAlign: TextAlign.center,),),
                Expanded(
                  child: Divider(),
                )
              ],
            ),
            SizedBox(height: 30,),
            SignUpLoginButton(title : '구글 이메일로 로그인',function : (){}),
            SizedBox(height: 20,),
            SignUpLoginButton(title : '구글 이메일로 로그인',function : (){}),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }






}