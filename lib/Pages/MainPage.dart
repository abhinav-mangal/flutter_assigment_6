import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Charts/BarChart.dart';
import 'package:flutter_assignment_6/Charts/AreaChart.dart';
import 'package:flutter_assignment_6/Charts/LineChart.dart';
import 'package:flutter_assignment_6/Charts/PieChart.dart';
import 'package:flutter_assignment_6/Pages/EmpListPage.dart';
import 'package:flutter_assignment_6/Pages/ChartsPage.dart';
import 'package:flutter_assignment_6/Pages/ListPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView(children: [
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 0),
          title: Text(
            'Types of Charts',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 0),
          title: Text(
            'Types of Lists',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ListPage()));
          },
        ),
      ]),
    );
  }
}
