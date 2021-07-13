import 'package:get_it/get_it.dart';
import 'package:timetracker/business_logic/view_model/schedule_view_model.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {

  serviceLocator.registerFactory<ScheduleViewModel>(() => ScheduleViewModel());


}