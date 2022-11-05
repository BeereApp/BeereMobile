import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PieCharts extends StatelessWidget {
  const PieCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      width: 210.h,
      child: PieChart(
        PieChartData(
            sectionsSpace: 0, centerSpaceRadius: 0, sections: pieChartSection),
      ),
    );
  }

  List<PieChartSectionData> get pieChartSection => [
        PieChartSectionData(
            color: Colors.blue,
            value: 8,
            title: '8%',
            radius: 110.r,
            titlePositionPercentageOffset: 0.8),
        PieChartSectionData(
            color: Colors.red, value: 10, title: '10%', radius: 110.r),
        PieChartSectionData(
            color: Colors.green, value: 13, title: '13%', radius: 110.r),
      ];
}
