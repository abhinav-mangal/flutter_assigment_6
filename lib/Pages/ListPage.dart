import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Charts/PieChart.dart';
import 'package:flutter_assignment_6/Pages/EmpListPage.dart';
import 'package:flutter_assignment_6/Pages/TablePage.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      body: ListView(children: [
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 0),
          title: Text(
            'List View',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EmpListPage()));
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 5, 0),
          title: Text(
            'Table View',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EmpTablePage()));
          },
        ),
      ]),
    );
  }
}
