import 'package:flutter/material.dart';
import 'package:interest_calculator_app/body.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        primaryColorLight: Colors.deepOrangeAccent,
        accentColor: Colors.orangeAccent,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Simple Interest Calcuclator App"),
        ),
        body: Body(),
      ),
    );
  }
}
