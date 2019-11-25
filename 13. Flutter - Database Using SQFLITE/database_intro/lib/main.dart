import 'package:database_intro/models/user.dart';
import 'package:database_intro/utils/database_helper.dart';
import 'package:flutter/material.dart';

List _users;
void main() async {

  var db = DatabaseHelper();

  // int savedUser = await db.saveUser(new User("NodeJs", "javaScript"));
  // print("User saved: $savedUser");

  _users = await db.getAllUsers();
  for(int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);
    print("Username: ${user.userName}, Id: ${user.id}");
  }

  int count = await db.getCount();
  print("Count: $count");

  User react = await db.getUser(3);
  print("Got username: ${react.userName}");

  // User reactUpdate = User.fromMap({
  //   "userName" : "UpdatedReact",
  //   "password" : "updatedPassword",
  //   "id" : 3
  // });

  // await db.upadateUser(reactUpdate);

  // int deleteItem = await db.deleteUser(4);
  // print(deleteItem);

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
      body: new ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, int position) {
          return new Card(
            color: Colors.white,
            elevation: 12.0,
            child: new ListTile(
              leading: new CircleAvatar(
                child: new Text("${User.fromMap(_users[position]).userName.substring(0, 1)}"),
              ),
              title: new Text("User: ${User.fromMap(_users[position]).userName}"),
              subtitle: new Text("Id: ${User.fromMap(_users[position]).id}"),
              onTap: ()=> debugPrint("${User.fromMap(_users[position]).password}"),
            ),
          );
        },
      ),
    );
  }
}