import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Model/MyAppBar.dart';
import 'package:flutter_assignment_6/Pages/EmpDetailPage.dart';
import 'package:octo_image/octo_image.dart';

class EmpListPage extends StatefulWidget {
  final String title;
  final String name;

  const EmpListPage({
    Key key,
    this.title,
    this.name,
  }) : super(key: key);

  @override
  _EmpListPageState createState() => _EmpListPageState(name);
}

class _EmpListPageState extends State<EmpListPage> {
  List data;
  String name;
  _EmpListPageState(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Welcome " + '$name'),
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
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 25,
                          child: Container(
                            // color: Colors.blue,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(50.0)),
                            child: ClipOval(
                              child: OctoImage(
                                image: NetworkImage(data[index]['imageUrl']),
                                progressIndicatorBuilder: OctoProgressIndicator
                                    .circularProgressIndicator(),
                              ),
                            ),
                          ),
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
