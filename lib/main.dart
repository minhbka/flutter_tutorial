import 'package:flutter/material.dart';
import './app_screens/home.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring UI widgets",
    home: Scaffold(
      appBar: AppBar(title: Text("Basic List View")),
      body:getListView()
    ),
  ));
}

Widget getListView(){
  var listView = new ListView(
    children:<Widget>[
      ListTile(
        leading:Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("Beautiful View!"),
        trailing:Icon(Icons.wb_sunny),
        onTap: ()=>debugPrint("Landscape tapped"),
      ),
      ListTile(
        leading:Icon(Icons.landscape),
        title: Text("Window"),
        subtitle: Text("Beautiful View!"),
        trailing:Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading:Icon(Icons.landscape),
        title: Text("Phone"),
        subtitle: Text("Beautiful View!"),
        trailing:Icon(Icons.wb_sunny),
      ),
      Text("Another element in List"),
      Container(
        margin:EdgeInsets.only(top:30.0),
        color:Colors.red,
        height: 50.0
      )
    ]
  );
  return listView;
}