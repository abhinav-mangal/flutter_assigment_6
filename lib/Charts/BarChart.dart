import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment_6/Model/MyAppBar.dart';
import 'package:flutter_assignment_6/Services/SalesData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  BarChart();

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  TooltipBehavior _tooltipBehavior;
  List<SalesData> chartData = [];

  Future<String> _loadSalesDataAsset() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future loadSalesData() async {
    String jsonString = await _loadSalesDataAsset();
    final jsonResponse = json.decode(jsonString);
    setState(() {
      for (Map<String, dynamic> i in jsonResponse) {
        chartData.add(SalesData.fromJson(i));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    loadSalesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: const Text('Bar Chart'),
        ),
        body: Center(
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Sales analysis'),
              legend: Legend(isVisible: true),
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries<SalesData, String>>[
                ColumnSeries<SalesData, String>(
                    dataSource: chartData,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ].toList()),
        ));
  }
}
