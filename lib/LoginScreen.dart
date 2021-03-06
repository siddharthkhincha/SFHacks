import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  final String title = 'Registration';
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  void _register() async {
    final FirebaseUser user = (await
    _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
    ).user;
    if (user != null) {
      print("success");
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      print("heer");
      setState(() {
        _success = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
                height:70,
                child:Center(
                  child: Text("Login Page", style : TextStyle(fontSize:30, color:Colors.grey[700])),
                )
            ),
            Container(
                height:470,
                child:Center(
                  child:Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width:200,
                          child:TextFormField(
                              controller: _emailController,
                            decoration: const InputDecoration(
                                hintText: 'abc@abc.com'
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width:200,
                          child:TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(labelText:
                            'Password'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          alignment: Alignment.center,
                          child: RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _register();
                              }
                              else
                                {
                                  print("false");
                                }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(_success == null
                              ? ''
                              : (_success
                              ? 'Successfully registered ' + _userEmail
                              : 'Registration failed')),
                        )
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
