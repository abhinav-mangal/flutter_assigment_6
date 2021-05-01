import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Pages/EmpDetailPage.dart';

// import 'DetailPage.dart';

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
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.black45,
                      ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(data[index]['firstName'] +
                            ' ' +
                            data[index]['lastName']),
                      ),
                      subtitle: Text(data[index]['email']),
                      leading: Image.network(
                        data[index]['imageUrl'],
                        fit: BoxFit.cover,
                        height: 40.0,
                        width: 40.0,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(data[index])));
                      },
                    );
                  });
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
