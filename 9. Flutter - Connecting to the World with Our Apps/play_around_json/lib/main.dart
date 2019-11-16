import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List _currencies = await getCurrencies();
  String _name = "";
  for(int i = 0; i<_currencies.length; i++) {
    print(_currencies[i]['name'] + '\n' + _currencies[i]['address']['street']);
    print(_currencies[i]['address']['suite']);
    print(_currencies[i]['address']['geo']['lat']);
    print(_currencies[i]['phone']);
  }
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('Hello'),
      ),
    ),
  ));
}

Future<List> getCurrencies() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/users';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}