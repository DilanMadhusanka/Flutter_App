import 'dart:convert';

import 'package:flutter/material.dart';
import '../util/utils.dart' as util;
import 'package:http/http.dart' as http;

class Climatic extends StatefulWidget {
  @override
  _ClimaticState createState() => _ClimaticState();
}

class _ClimaticState extends State<Climatic> {

  String _cityEntered;

  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(builder: (BuildContext context) {
        return new ChangeCity();
      })
    );

    if (results != null && results.containsKey('enter')) {
      _cityEntered = results['enter'].toString();
    }
    else {
      print('Nothing!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Climatic'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () {
              _goToNextScreen(context);
            },
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/umbrella.png',
            width: 490.0,
            height: 1200.0,
            fit: BoxFit.fill,
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: new Text('${_cityEntered == null ? util.defaultCity : _cityEntered}',
            style: cityStyle(),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/light_rain.png'),
          ),
          new Container(
            child: updateTempWidget(_cityEntered),
          )
        ],
      ),
    );
  }
  Future<Map> getWeather(String appId, String city) async {
    String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.appId}&units=imperial';
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return new FutureBuilder(
      future: getWeather(util.appId, city == null ? util.defaultCity.toString() : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData) {
          Map content = snapshot.data;
          return new Container(
            margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ListTile(
                  title: new Text(content['main']['temp'].toString() + " F",
                    style: tempStyle(),
                  ),
                  subtitle: new ListTile(
                    title: new Text(
                      "Humidity: ${content['main']['humidity'].toString()}\n"
                      "Min: ${content['main']['temp_min'].toString()} F\n"
                      "Max: ${content['main']['temp_max'].toString()} F",

                      style: extraData(),
                    ),
                  ),
                )
              ],
            ),
          );
        }else {
          return new Container();
        }
      });
  }
}

class ChangeCity extends StatelessWidget {

  var _cityFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text('Change City'),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/white_snow.png',
                width: 490.0,
                height: 1200.0,
                fit: BoxFit.fill,
            ),
          ),
          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: 'Enter City'
                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              new ListTile(
                title: new FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'enter': _cityFieldController.text
                    });
                  },
                  textColor: Colors.white70,
                  color: Colors.redAccent,
                  child: new Text('Get Weather'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic
  );
}

TextStyle extraData() {
  return new TextStyle(
    color: Colors.white70,
    fontStyle: FontStyle.normal,
    fontSize: 17.0
  );
}

TextStyle tempStyle() {
  return new TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9
  );
}