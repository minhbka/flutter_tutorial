import 'package:flutter/material.dart';
import './app_screens/home.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring UI widgets",
    home: Scaffold(
      appBar: AppBar(title: Text("Long List")),
      body:getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>debugPrint("FAB is clicked"),
        child:Icon(Icons.add),
        tooltip:'Add one more Item',
      ),
    ),
  ));
}

void showSnackBar(BuildContext context, String item){
  var snackBar = SnackBar(
    content:Text("You just tapped $item"),
    action:SnackBarAction(
      label:"Undo",
      onPressed:()=>debugPrint('Performing dummy Undo opration')
    )
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        onTap:()=>showSnackBar(context, listItem[index]),
      );
    }
  );
  return listView;
}