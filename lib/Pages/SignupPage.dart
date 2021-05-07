import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_6/Pages/LoginPage.dart';
import 'package:flutter_assignment_6/Services/AuthData.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/LoginPage',
              );
            },
          ),
          title: Text('SignUp'),
          // elevation: 0,
        ),
        body: Container(
          color: Colors.blue[50],
          child: Center(
              child: Card(
                  // color: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    height: 440,
                    width: 300,
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Full Name'),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Entre your Name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                name = value;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Email'),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty ||
                                    !value.contains('@') &&
                                        !value.contains('.com')) {
                                  return 'Invalid Email';
                                }
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
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Confirm Password'),
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
                              label: Text('Signup'),
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
        ));
  }

  Map<String, String> _authData = {'email': '', 'password': ''};

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .signUp(_authData['email'], _authData['password']);

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(
                name: name,
              )));
    } catch (error) {
      var errorMessage = 'Incorrent Email or Password. Try Again.';
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
