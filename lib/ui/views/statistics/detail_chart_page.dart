
import 'package:flutter/material.dart';
import 'package:timetracker/ui/views/statistics/time_log_graph.dart';

class DetailChartPage extends StatefulWidget{

  @override
  _DetailChartPageState createState() => _DetailChartPageState();
}

class _DetailChartPageState extends State<DetailChartPage> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(
          backgroundColor: Colors.white,
          title: Text('CATCHTIME',style: TextStyle(fontFamily: 'Staatliches',fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
          centerTitle: true, elevation: 0,
       ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 400,
                  alignment: Alignment.center,
                  child: TimeLogGraph(
                    contentIndicator: true,
                    chartContent: [80,70,60,70,80,90,100,90,80],
                    weekOrMonth: true,
                  )
              )

            ],
          )
      ),
    );
  }
}
