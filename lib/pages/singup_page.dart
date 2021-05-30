import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {

  static final String id = 'signup_page';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello World",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue[900]),),
      ),
    );
  }
}
