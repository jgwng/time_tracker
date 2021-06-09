import 'package:flutter/material.dart';
import 'package:timetracker/constants/app_themes.dart';
class AuthTFT extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Icon? suffixIcon;
  final bool obscureText;
  final FocusNode? focusNode;
  final function;
  const AuthTFT({required this.labelText, this.validator,required this.controller,this.focusNode,
    this.function, this.suffixIcon, this.obscureText = false, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      margin: EdgeInsets.only(top:5),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        focusNode: focusNode,
        cursorColor: Colors.black,
        validator: validator,
        style: AppThemes.textTheme.bodyText1!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onFieldSubmitted: function,
        decoration: InputDecoration(
            fillColor: Colors.grey[200],
            filled: true,
            labelText: labelText,
            labelStyle: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(4.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(4.0),
            )),
      ),
    );
  }
}