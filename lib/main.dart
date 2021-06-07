import 'package:flutter/material.dart';
import 'Weight.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Whieght",
      home: new Home(),
    );
  }
}
