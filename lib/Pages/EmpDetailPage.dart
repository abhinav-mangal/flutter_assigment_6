import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.data);
  final data;

  // DetailPage(this.data);
  // final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees Details'),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Image(image: NetworkImage(data['imageUrl'])),
                  ),
                ],
              ),
              Text(
                "Employee Id: " + data['id'].toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              // Text(data['imageUrl']),
              Text(
                "Name: " + data['firstName'] + " " + data['lastName'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "Email Id: " + data['email'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "Phone: " + data['contactNumber'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "Age: " + data['age'].toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "Date of Birth: " + data['dob'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "Salry: " + data['salary'].toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "Address: " + data['address'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
