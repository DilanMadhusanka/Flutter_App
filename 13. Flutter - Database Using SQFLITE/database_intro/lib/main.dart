import 'package:database_intro/models/user.dart';
import 'package:database_intro/utils/database_helper.dart';
import 'package:flutter/material.dart';

List _users;
void main() async {

  var db = DatabaseHelper();

  int savedUser = await db.saveUser(new User("Flutter", "dart"));
  print("User saved: $savedUser");

  _users = await db.getAllUsers();
  for(int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);
    print("${user.userName}");
  }

  runApp(new MaterialApp(
    title: 'Database',
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}