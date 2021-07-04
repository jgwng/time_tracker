import 'package:flutter/material.dart';
import 'package:timetracker/ui/widgets/nickname_change_dialog.dart';

Future<dynamic> standardDialog(
    BuildContext context) {

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return NickNameChangeDialog();
    },
  );
}