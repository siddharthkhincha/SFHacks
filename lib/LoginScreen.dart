import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
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
                  child:Column(
                    children: [
                      Container(
                        width:120,
                        child:TextFormField(
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
                        width:120,
                        child:TextFormField(
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
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
