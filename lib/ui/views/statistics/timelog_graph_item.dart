import 'package:flutter/widgets.dart';
import 'package:timetracker/constants/app_themes.dart';

class GraphItemWidget extends StatelessWidget {
  const GraphItemWidget({required this.firstVisibleItem, required this.currentIndex,required this.chartMaxValue,required this.chartCurrentValue,required this.chartMinValue});
  final num firstVisibleItem;
  final num currentIndex;
  final num chartMaxValue;
  final num chartMinValue;
  final num chartCurrentValue;

  @override
  Widget build(BuildContext context) {
    return graphBar(context, firstVisibleItem, currentIndex,
        chartCurrentValue,chartMaxValue,chartMinValue);
  }

  Widget graphBar(BuildContext context, num firstItem, num itemIndex,num chartCurrentValue,
      num chartMaxValue,num chartMinValue) {
    return Container(
      child: CustomPaint(
        size: Size(0.35 * (double.infinity), 10),
        child: Center(),
        foregroundPainter:
        (chartCurrentValue==double.nan)? null : GraphItemPainter(coloredItem: firstItem, currentItemIndex: itemIndex,
            currentValue: chartCurrentValue,chartMaxValue: chartMaxValue,chartMinValue: chartMinValue),
      ),
    );
  }
}

class GraphItemPainter extends CustomPainter {
  num coloredItem;
  num currentItemIndex;
  num currentValue;
  num chartMaxValue;
  num chartMinValue;
  GraphItemPainter({
    required this.coloredItem,
    required this.currentItemIndex,
    required this.currentValue,
    required this.chartMaxValue,
    required this.chartMinValue
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    if (coloredItem == (currentItemIndex)) {
      paint.color = AppThemes.pointColor;
    } else {
      paint.color = Color.fromRGBO(141, 146, 145, 0.5);
    }

    double percentage = 0;
    if(chartMinValue == chartMaxValue){
      percentage = 0.5;
    }
    else{
      percentage = ((currentValue-chartMinValue)/(chartMaxValue-chartMinValue));
    }
    // double
    paint.strokeWidth = 8;
    paint.strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(size.width / 2, 107-percentage*97),
      Offset(size.width / 2, 205),//max value
      paint,
    );

  }
  // 완료선의 마지막 점 표시

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}