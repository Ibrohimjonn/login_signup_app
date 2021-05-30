import 'package:flutter/material.dart';
import 'package:sharepref/pages/home_page.dart';
import 'package:sharepref/pages/singup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        SignupPage.id:(context)=>SignupPage(),
      },
    );
  }
}

