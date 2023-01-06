import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({Key? key}) : super(key: key);

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2019, 13, 23),
      ChartData(2020, 19, 15),
      ChartData(2021, 24, 26),
      ChartData(2022, 19, 29),
    ];
    return SizedBox(
        height: 300.h,
        width: 380.w,
        child: SfCartesianChart(
            primaryXAxis: NumericAxis(
              minimum: 2018,
              maximum: 2023,
              interval: 6,
            ),
            primaryYAxis: NumericAxis(
              minimum: 5,
              maximum: 30,
              interval: 6,
            ),
            series: <ChartSeries<ChartData, double>>[
              // Renders column chart
              ColumnSeries<ChartData, double>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y),
              ColumnSeries<ChartData, double>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y1),
            ]));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final double x;
  final double y;
  final double y1;
}
