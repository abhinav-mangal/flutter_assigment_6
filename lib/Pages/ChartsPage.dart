import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Charts/BarChart.dart';
import 'package:flutter_assignment_6/Charts/AreaChart.dart';
import 'package:flutter_assignment_6/Charts/LineChart.dart';
import 'package:flutter_assignment_6/Charts/PieChart.dart';
import 'package:flutter_assignment_6/Pages/EmpListPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charts"),
      ),
      body: ListView(children: [
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 0),
          title: Text(
            'Line Chart',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LineChart()));
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 0),
          title: Text(
            'Pie Chart',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PieChart()));
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 0),
          title: Text(
            'Bar Chart',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BarChart()));
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 0),
          title: Text(
            'Area Chart',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AreaChart()));
          },
        ),
      ]),
    );
  }
}
