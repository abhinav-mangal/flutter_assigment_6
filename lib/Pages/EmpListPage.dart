import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Pages/EmpDetailPage.dart';

class EmpListPage extends StatefulWidget {
  EmpListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmpListPageState createState() => _EmpListPageState();
}

class _EmpListPageState extends State<EmpListPage> {
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
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      shadowColor: Colors.blue,
                      child: ListTile(
                        title: Text(
                          data[index]['firstName'] +
                              ' ' +
                              data[index]['lastName'],
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          data[index]['email'],
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontWeight: FontWeight.w400),
                        ),
                        leading: Image.network(
                          data[index]['imageUrl'],
                          fit: BoxFit.cover,
                          height: 40.0,
                          width: 40.0,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue[400],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(data[index])));
                        },
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator.adaptive());
          },
        ),
      ),
    );
  }
}
