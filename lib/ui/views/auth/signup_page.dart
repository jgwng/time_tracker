import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timetracker/ui/views/auth/local_widget/signUp_login_button.dart';
import 'package:timetracker/ui/widgets/auth_text_field.dart';
import 'package:timetracker/ui/widgets/standard_button.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  TextEditingController? nicknameController;
  TextEditingController? emailController;
  TextEditingController? pwController;

  FocusNode? nicknameNode;
  FocusNode? emailNode;
  FocusNode? pwNode;


  @override
  void initState(){
    super.initState();
    nicknameController = TextEditingController();
    emailController = TextEditingController();
    pwController = TextEditingController();

    nicknameNode = FocusNode();
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height:60,),
          Image.asset('assets/images/auth/stopwatch.png'),
          SizedBox(height: 40,),
          AuthTFT(labelText: '닉네임',controller: nicknameController!,focusNode: nicknameNode,),
          SizedBox(height: 5,),
          AuthTFT(labelText: '이메일',controller: emailController!,focusNode: emailNode,),
          SizedBox(height: 5),
          AuthTFT(labelText: '비밀번호',controller: pwController!,focusNode: pwNode,),
          SizedBox(height: 10),
          StandardButton(title : '이메일로 간편 가입', function : (){}),
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
          SignUpLoginButton(title : '회원 가입하기', function : (){}),
          SizedBox(height: 20,),
          SignUpLoginButton(title : '회원 가입하기', function : (){}),
          SizedBox(height: 20,),
        ],
      ),
    );
  }


}