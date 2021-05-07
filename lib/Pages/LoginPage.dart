import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Pages/EmpListPage.dart';
import 'package:flutter_assignment_6/Services/AuthData.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final String name;

  const LoginPage({Key key, this.name}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState(name);
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String name;
  _LoginPageState(this.name);

  @override
  Widget build(BuildContext context) {
    // var _name = widget.name;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
            actions: [
              FloatingActionButton.extended(
                heroTag: 'b1',
                onPressed: () {
                  Navigator.pushNamed(context, '/SignupPage');
                },
                backgroundColor: Colors.blue,
                elevation: 0,
                label: Row(
                  children: [
                    Text(
                      'Signup',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.person_add_alt_1),
                  ],
                ),
              )
            ],
            automaticallyImplyLeading: false,
          ),
          body: Container(
            color: Colors.blue[50],
            child: Center(
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 275,
                      width: 300,
                      padding: EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Email'),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Entre your Email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _authData['email'] = value;
                                },
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Password'),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Entre your password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _authData['password'] = value;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              FloatingActionButton.extended(
                                heroTag: 'b2',
                                label: Text('Login'),
                                elevation: 0,
                                onPressed: () {
                                  _submit();
                                  if (_formKey.currentState.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Processing Data')));
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ))),
          )),
    );
  }

  Map<String, String> _authData = {'email': '', 'password': ''};

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .login(_authData['email'], _authData['password']);

      await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EmpListPage(
                name: name,
              )));
    } catch (error) {
      var errorMessage = 'Incorrent Email or Password. Try after sometime.';
      _showErroeDialog(errorMessage);
    }
  }

  void _showErroeDialog(String msg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("An Error Occured"),
              content: Text(msg),
              actions: [
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: Text(
                    'Okay',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                )
              ],
            ));
  }
}
