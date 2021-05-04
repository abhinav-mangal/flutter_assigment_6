import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Pages/EmpListPage.dart';
import 'package:flutter_assignment_6/Pages/LoginPage.dart';
import 'package:flutter_assignment_6/Pages/SignupPage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Services/AuthData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChartApp(),
  );
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Authentication())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Charts',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          '/LoginPage': (BuildContext context) => LoginPage(),
          '/SignupPage': (BuildContext context) => SignupPage(),
          '/EmpListPage': (BuildContext context) => EmpListPage(),
          // '/DetailPage': (BuildContext context) => DetailPage(),
        },
      ),
    );
  }
}
