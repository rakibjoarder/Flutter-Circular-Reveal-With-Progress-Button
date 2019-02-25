import 'package:flutter/material.dart';
import 'package:flutter_circular_reveal/circular_reveal.dart';


main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Reveal with Progress Button24',
      home: Myapp(),
    );
  }
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: CircularReveal(),
      )
    );
  }
}


