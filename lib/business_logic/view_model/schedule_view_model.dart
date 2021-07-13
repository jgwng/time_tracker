import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/service/service_locator.dart';

final scheduleInfo = ChangeNotifierProvider((ref) => serviceLocator<ScheduleViewModel>());

class ScheduleViewModel extends ChangeNotifier{

}