import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'DetailPage.dart';

class EmpTablePage extends StatefulWidget {
  EmpTablePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmpTablePageState createState() => _EmpTablePageState();
}

class _EmpTablePageState extends State<EmpTablePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees List'),
      ),
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/employees.json'),
          builder: (context, snapshot) {
            var data = json.decode(snapshot.data.toString());
            if (snapshot.hasData) {
              data.sort((a, b) {
                return a['firstName']
                    .toLowerCase()
                    .toString()
                    .compareTo(b['lastName'].toLowerCase().toString());
              });
              return Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DataTable(columns: [DataColumn(label: Text('Name'))], rows: [DataCell(Text())])
                ],
              ));
              // StreamBuilder<List>(
              //   builder: (context, snapshot) {
              //     return DataTable(
              //       columns: [DataColumn(label: Text('Name'))],
              //       rows: snapshot.data.map(
              //           (data) => DataRow(cells: [DataCell(Text('firtName'))])),
              //     );
              //   },
              //   // itemCount: snapshot.data.length,
              //   // itemBuilder: (BuildContext context, int index) {

              //   // }
              // );
              // );
            } else
              return Center(
                child: Text(
                  'Loading..',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              );
          },
        ),
      ),
    );
  }
}
