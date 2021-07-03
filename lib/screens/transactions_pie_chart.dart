import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class TransactionsPieChart extends StatelessWidget {
  const TransactionsPieChart({
    Key? key,
    required this.asset,
    required this.liability,
  }) : super(key: key);

  final double asset;
  final double liability;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 22,
        pieTouchData: PieTouchData(
          enabled: true,
        ),
        sectionsSpace: 0,
        sections: [
          PieChartSectionData(
            showTitle: false,
            value: asset,
            color: primary,
            titleStyle: TextStyle(
              color: Colors.black,
            ),
            radius: 15,
          ),
          PieChartSectionData(
            showTitle: false,
            value: liability.abs(),
            color: danger,
            titleStyle: TextStyle(
              color: Colors.black,
            ),
            radius: 15,
          ),
        ],
        // read about it in the PieChartData section
      ),
      swapAnimationDuration: Duration(milliseconds: 1000),
      swapAnimationCurve: Curves.linear,
    );
  }
}
