import 'package:flutter/material.dart';
import './app_screens/home.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring UI widgets",
    home: Scaffold(
      appBar: AppBar(title: Text("Long List")),
      body:getListView()
    ),
  ));
}
List<String> getListElements(){
  var items = List<String>.generate(1000, (index) => "Item $index");
  return items;
}


Widget getListView(){
  var listItem = getListElements();
  var listView = ListView.builder(
    itemBuilder: (context, index){
      return ListTile(
        leading: Icon(Icons.arrow_right),
        title:Text(listItem[index]),
        onTap:()=>debugPrint("${listItem[index]} was tapped"),
      );
    }
  );
  return listView;
}