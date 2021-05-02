import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Charts/AreaChart.dart';
import 'package:flutter_assignment_6/Charts/BarChart.dart';
import 'package:flutter_assignment_6/Charts/LineChart.dart';
import 'package:flutter_assignment_6/Charts/PieChart.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(15)),
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Table View',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(width: 0),
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(flex: 15),
                1: FlexColumnWidth(55),
                2: FixedColumnWidth(64),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Emp ID:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TableCell(
                      child: Text(
                    " " + data['id'].toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  )),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Name:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TableCell(
                      child: Text(
                    " " + data['firstName'] + " " + data['lastName'],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  )),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Email Id:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TableCell(
                      child: Text(
                    " " + data['email'],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  )),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Contact:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TableCell(
                      child: Text(
                    " " + data['contactNumber'],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  )),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Age:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TableCell(
                      child: Text(
                    " " + data['age'].toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  )),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'DOB:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TableCell(
                      child: Text(
                    " " + data['dob'],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  )),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Salary:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TableCell(
                      child: Text(
                    " " + data['salary'].toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  )),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Address:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TableCell(
                      child: Text(
                    " " + data['address'],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  )),
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(15)),
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Chart View',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LineChart()));
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AreaChart()));
            },
          ),
        ],
      ),
    );
  }
}
