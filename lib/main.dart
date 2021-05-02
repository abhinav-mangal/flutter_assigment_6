import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Pages/EmpListPage.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Charts',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EmpListPage(),
    );
  }
}
