import 'package:flutter/material.dart';
import 'package:timetracker/ui/widgets/modal_bottom_sheet/start_end_time_picker_sheet.dart';

Future<DateTime?> onStartNEndTimePickerBottomSheet(BuildContext context,String title)async {
  DateTime? result = await showModalBottomSheet<DateTime>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    context: context,
    builder: (context) {
      return StartEndTimePickerSheet(title : title);
    },
  );
  return result;
}