import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Screen',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _nameFieldController,
              decoration: new InputDecoration(
                labelText: 'Enter your name'
              ),
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              child: new Text('Send to Next Screen'),
              onPressed: () {
                var router = new MaterialPageRoute(
                  builder: (BuildContext context) => new NextScreen()
                );
                Navigator.of(context).push(router);
              },
            ),
          )
        ],
      )
    );
  }
}

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Second Screen'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
    );
  }
}