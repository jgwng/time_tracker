
import 'dart:async';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/constants/app_themes.dart';
class DetailChartPage extends StatefulWidget{
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  @override
  _DetailChartPageState createState() => _DetailChartPageState();
}

class _DetailChartPageState extends State<DetailChartPage> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
  bool? isWeek;
  bool isPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isWeek = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('CATCHTIME',style: TextStyle(fontFamily: 'Staatliches',fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black),),
        centerTitle: true, elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24,top: 20,bottom: 20),
              child: Text('Statistics',style: AppThemes.textTheme.headline1,),
            ),
            selectWorM(),
            SizedBox(height: 20,),
            Container(
              width : double.infinity,
              height  : 300,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                color: const Color(0xff81e5cd),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'Mingguan',
                            style: TextStyle(
                                color: const Color(0xff0f4a3c), fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Grafik konsumsi kalori',
                            style: TextStyle(
                                color: const Color(0xff379982), fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: BarChart(
                                isPlaying ? randomData() : mainBarData(),
                                swapAnimationDuration: animDuration,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: const Color(0xff0f4a3c),
                          ),
                          onPressed: () {
                            setState(() {
                              isPlaying = !isPlaying;
                              if (isPlaying) {
                                refreshState();
                              }
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width : double.infinity,
              height  : 180,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24,right:24,top:24),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('하루 통계',style: AppThemes.textTheme.subtitle1,),
                        Text('2021/07/01',style: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey),)
                      ],
                    ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,

                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('10개',style: AppThemes.textTheme.headline1!.copyWith(
                                  fontSize: 30
                                ),),
                                SizedBox(height:10),
                                Text('전체 계획수',style: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey))
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            margin: EdgeInsets.symmetric(horizontal: 45),
                            child: VerticalDivider(width: 1,thickness: 2,color: Colors.black,),
                          ),
                          Container(
                            width: 80,

                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('10개',style: AppThemes.textTheme.headline1!.copyWith(
                                    fontSize: 30
                                ),),
                                SizedBox(height:10),
                                Text('전체 계획수',style: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectWorM(){
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  isWeek = !isWeek!;
                });
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color : isWeek! ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Text('주별 보기',style: AppThemes.textTheme.bodyText1!.copyWith(
                    color : isWeek! ? Colors.black : Colors.grey
                ),),
              ),
            )
          ),
          SizedBox(width:20),
          Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isWeek = !isWeek!;
                  });
                },
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color : !isWeek! ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Text('월별 보기',style: AppThemes.textTheme.bodyText1!.copyWith(
                    color : !isWeek! ? Colors.black : Colors.grey
                  ),),
                ),
              )
          )
        ],
      ),
    );
  }


  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! PointerUpEvent &&
                barTouchResponse.touchInput is! PointerExitEvent) {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            } else {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 5:
            return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 6:
            return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          default:
            return throw Error();
        }
      }),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      await refreshState();
    }
  }
}
