import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }

}

class MakeItRainState extends State<StatefulWidget> {

  int _moneyCounter = 0;
  void _rainMoney() {
    setState(() {
      _moneyCounter = _moneyCounter + 100;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make It Rain"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text("Get Rich",
                      style: new TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize:29.9
                    )),
            ),
            new Expanded(
              child: new Center(
                child: new Text('$_moneyCounter',
                style: new TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 46.9,
                  fontWeight: FontWeight.w800
                  )),
              ),
            ),
            new Expanded(
              child: new Center(
                child: FlatButton(
                  color: Colors.lightGreen,
                  onPressed: ()=>_rainMoney(), 
                  child: new Text("Let It Rain!",
                  style: new TextStyle(
                    fontSize: 19.9,
                  )),),
              ),)
          ],
        ),
      ),
    );
  }
}