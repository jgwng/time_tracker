import 'dart:ui';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:timetracker/constants/app_themes.dart';
import 'package:timetracker/ui/views/statistics/timelog_graph_item.dart';
class TimeLogGraph extends StatefulWidget {
  TimeLogGraph({required this.chartContent, required this.contentIndicator,required this.weekOrMonth});

  // 활동량과 몸무게 구분, true - 몸무게,false - 활동량
  final bool contentIndicator;//contentIndicator - true : activity, false - weight
  final bool weekOrMonth;
  final List<dynamic> chartContent;

  @override
  _TimeLogGraphState createState() => new _TimeLogGraphState();
}

class _TimeLogGraphState extends State<TimeLogGraph>{
  var _keys = {};
  ScrollController scrollController = ScrollController();
  int? secondItemIndex;
  bool indicator = false;
  double itemWidth =60;
  double targetLine = 120;
  static List<double> frontChartItem = [0,0,0];
  static List<double> behindChartItem =[0,0];
  List<num> realChartItem = [];
  List <dynamic> chartContent = [];
  num? largestChartValue;
  num? smallestChartValue;
  List<num>? chartItem;
  bool isFirst = true; // 확인하고 지우기
  int index = 0;

  @override
  void initState() {
    super.initState();
    setChartContent();
  }

  // 그래프에 표현될 정보 정리
  void setChartContent(){
    if(widget.chartContent.length==1)
      secondItemIndex = 2;
    else
      secondItemIndex = widget.chartContent.length;

    indicator = widget.weekOrMonth;
    for(int i=0;i<widget.chartContent.length;i++){
      num value =  widget.chartContent[i];// / widget.chartContent[i].count; //반올림
      realChartItem.add(value);
    }
    chartItem = [...frontChartItem,...realChartItem,...behindChartItem];
    largestChartValue = realChartItem.reduce(max);
    smallestChartValue = realChartItem.reduce(min);
    isFirst = true;
  }

  /// so all visible item's index are in this _items.
  @override
  Widget build(BuildContext context) {
    if(indicator != widget.weekOrMonth){
      realChartItem = [];
      isFirst = true;
      // scrollController.jumpTo( (chartItem.length-1)*itemWidth);
      setChartContent();
    }
    if(widget.chartContent.length>4){
      scrollController = ScrollController(initialScrollOffset: (widget.chartContent.length-1)*itemWidth);
    }
    var listViewKey = RectGetter.createGlobalKey();
    var listView = RectGetter(
      key: listViewKey,
      child: Container(
        width: itemWidth*6,
        height: 380,
        child: ListView.builder(
          key: PageStorageKey<String>('Chart'),
          itemCount: chartItem!.length,
          addAutomaticKeepAlives: true,
          physics: ClampingScrollPhysics(),
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int ind) {
            index = ind;
            /// Make every item have the ability to get rect,
            /// and save keys for RectGetter and its index into _keys.
            _keys[index] = RectGetter.createGlobalKey();
            return RectGetter(
              key: _keys[index],
              child: graphContent(index),
            );
          },
        ),
      ),
    );

    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child:Column(
          children: [
            buildGraph(listView,listViewKey),
            ],
        )
    );
  }
  // 그래프 각각의 위젯 그리기, 앞에 frontChartItem,behindChartItem 은 그래프 위치를 위해 넣은 요소들음
  Widget graphContent(int index){
    if(((index)<2) | (index > widget.chartContent.length+1)){
      return Container(
        width: itemWidth,
        color: Colors.white,
      );
    }
    else{
      return graphItem(index,chartItem![index+1]);
    }
  }

  Widget buildGraph(var listView, var listViewKey){
    return Stack(
      children: [
        Container(
          width:double.infinity,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: Container(
                  child: NotificationListener<ScrollEndNotification>(
                  onNotification: (notification) {
                    /// print all visible item's index when scroll updated.
                    isFirst = false;
                    setCurrentItem(listViewKey,realChartItem);

                    return true;
                  },
                  child: listView,
                )),
          ),
        ),
        // Container(
        //     padding: EdgeInsets.only(left:24,right:24,top:230),
        //     child: Divider(height: 1,thickness: 1,color: Colors.black,)
        // )
      ],
    );
  }

  setCurrentItem(listViewKey,List<num> chartContent) {
    var rect = RectGetter.getRectFromKey(listViewKey);
    var _items = <int>[];
    _keys.forEach((index, key) {
      var itemRect = RectGetter.getRectFromKey(key);
      if (itemRect != null &&
          !(itemRect.left > rect!.right || itemRect.right < rect.left))
        _items.add(index);
    });
    if(!isFirst)
    {
      Future.delayed(Duration(milliseconds: 300), () {
        if ((scrollController.offset - itemWidth) < 0) {
          scrollController.jumpTo(0.1);
          secondItemIndex = 2;
        }
        else if(scrollController.offset >= scrollController.position.maxScrollExtent-0.1){
          scrollController.jumpTo(scrollController.position.maxScrollExtent-0.1);
          secondItemIndex = chartContent.length+1;
        }
        else if ((scrollController.offset - itemWidth) % itemWidth >= 0.5) {
          scrollController.jumpTo(_items[0] * itemWidth);
          secondItemIndex = _items[2];
        }
        else if ((scrollController.offset - itemWidth) % itemWidth == 0) {
          secondItemIndex = 2;
        }
        else {
          scrollController.jumpTo(_items[2] * itemWidth);
          secondItemIndex = _items[2];
        }
      });
      setState(() {});
    }

  }

  //그래프 아래 기간 표시(weekOrMonth : true - 월별 / false - 주별)
  String dateText(bool weekOrMonth){
    switch(weekOrMonth){
      case true:
        String start;
        start = widget.chartContent[secondItemIndex!-2].date+'월';
        return start;

      case false:
        String start = widget.chartContent[secondItemIndex! - 2].date;
        DateTime date = DateFormat("yyyy-MM-dd").parse(start);
        date = date.add(Duration(days: 6));
        String end = '${date.year}-${date.month}-${date.day}';

        String formattedResult = start + " ~ " + end;
        return formattedResult;

    }
    return "";
  }

  String chartLabelText(bool weekOrMonth,int index){
    switch(weekOrMonth){
      case false:
        return (index-1).toString()+"주";

      case true:
        var start = widget.chartContent[index-2].toString();
        return start;

    }
    return "";
  }

  // 현재 선택된 ChartItem 정보 표현
  String contentText(bool contentIndicator){
    switch(contentIndicator){
      case true:
        num data = (widget.chartContent[secondItemIndex!-2].total / widget.chartContent[secondItemIndex!-2].count);

        String hour = ((data)~/60).toString();
        String minute = ((data)%60).toStringAsFixed(0);
        return "$hour시간  $minute분";


      case false:
        num data = widget.chartContent[secondItemIndex!-2].total / widget.chartContent[secondItemIndex!-2].count;
        String result = data.toStringAsFixed(2)+"kg";
        return result;
    }
    return "";
  }

  //주간 변화 정보 표현
  String changeText(bool contentIndicator, bool weekOrMonth){
    switch(contentIndicator){//contentIndicator - true : activity, false - weight
      case true:
        String result = "";
        if(secondItemIndex == 2 ){
          result = "-시간 --분";
        }
        else{
          num before  = widget.chartContent[secondItemIndex!-3].total / widget.chartContent[secondItemIndex!-3].count;
          num after = widget.chartContent[secondItemIndex!-2].total / widget.chartContent[secondItemIndex!-2].count;
          num subtract = (after-before);

          if(subtract<0 && subtract>-60){
            String minute = (subtract) .floor().abs().toStringAsFixed(0);
            result = "- $minute분";
          }
          else {
            String hour = ((subtract) ~/ 60).toString();
            String minute = ((subtract) % 60).floor().toStringAsFixed(0);
            result = "$hour시간  $minute분";
          }
        }
        return result;

      case false:
        String result = "";
        if(secondItemIndex == 2){
          result = "-.--kg";
        }
        else{
          num before  = widget.chartContent[secondItemIndex!-3].total / widget.chartContent[secondItemIndex!-3].count;
          num after = widget.chartContent[secondItemIndex!-2].total / widget.chartContent[secondItemIndex!-2].count;
          result = (after-before).toStringAsFixed(2)+"kg";
        }
        return result;


    }return "";
  }





  //그래프내에 하나의 정보를 표현하는 하나의 막대
  Widget graphItem(int index, num content){
    return GestureDetector(
      onTap: (){
        setState(() {
          scrollController.jumpTo((index-2) * itemWidth);
          secondItemIndex = index;
        });
      },
      child: Container(
          width: itemWidth,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                width: itemWidth,
                /// random height
                height: 250,
                child: Center(
                  child: GraphItemWidget(
                      firstVisibleItem: secondItemIndex!,
                      currentIndex: index,
                      chartCurrentValue: content,
                      chartMaxValue: largestChartValue!,
                      chartMinValue: smallestChartValue!
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 40,
                child: Text(
                  chartLabelText(widget.weekOrMonth, index),
                  textAlign: TextAlign.center,
                  style: AppThemes.textTheme.bodyText1!.copyWith(
                      color: Color.fromRGBO(68, 75, 86, 1.0),fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          )),
    );
  }

  //기록횟수, 주간변화 표현하는 위젯
  Widget statisticList(String title, String content) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border:
            Border(bottom: BorderSide(color: AppThemes.inActiveColor
            ))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppThemes.textTheme.headline1!.copyWith(
                color: Color.fromRGBO(75, 75, 75, 1.0)
            ),),
            Text(content, style: TextStyle(fontFamily : "NunitoSans",
                fontWeight : FontWeight.w700, color: Color.fromRGBO(75, 75, 75, 1.0), fontSize: 22
            )),
          ],
        )
    );
  }
}