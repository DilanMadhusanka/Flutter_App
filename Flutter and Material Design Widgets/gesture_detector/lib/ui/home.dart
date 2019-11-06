import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new CustomButton(),
              ),
            );
          }
        
        }
        
        class CustomButton extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return new GestureDetector(onTap: () {
              final snackBar = new SnackBar(content: new Text("Hello Gesture!"),
              backgroundColor: Theme.of(context).unselectedWidgetColor,
              duration: new Duration(hours: 0,minutes: 0,seconds: 1,milliseconds: 500,microseconds: 0),);
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: new Container(
              padding: new EdgeInsets.all(18.8),
              decoration: new BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: new BorderRadius.circular(5.5)
              ),
              child: new Text("First Button!"),
            ),
            );
          }
        }