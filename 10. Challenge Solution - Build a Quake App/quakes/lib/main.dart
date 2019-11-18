import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Map _data;
List _features;
void main() async {
  _data = await getQuakes();
  _features = _data['features'];
  runApp(new MaterialApp(
    title: 'Quakes',
    home: new Quakes(),
  ));
}

class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quakes'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: _features.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (BuildContext context, int position){
            if(position.isOdd) return new Divider();
            final index = position ~/ 2;
            return new ListTile(
              title: new Text("Mag: ${_features[index]['properties']['mag']}",
              style: TextStyle(fontSize: 19.5,
              color: Colors.orange,
              fontWeight: FontWeight.w500),
              ),
              subtitle: new Text("${_features[index]['properties']['place']}",
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
                fontStyle: FontStyle.italic),
              ),
              leading: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Text("${_features[index]['properties']['mag']}",
                style: new TextStyle(
                  fontSize: 16.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal
                ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}

Future<Map> getQuakes() async {
  String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}