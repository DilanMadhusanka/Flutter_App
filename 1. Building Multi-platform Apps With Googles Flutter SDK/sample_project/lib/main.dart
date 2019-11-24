import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Welcome App",
      home: new Welcome(),
    )
  );
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: new Center(
        child: new Text(
          "Welcome to Flutter!",
          textDirection: TextDirection.ltr,
          style: new TextStyle(
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            fontSize: 23
          ),
        ),
      ),
      
    );
  }
  
}