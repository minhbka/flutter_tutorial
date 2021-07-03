import 'package:flutter/material.dart';
import 'package:flutter_firts_prj/screens/note_detail.dart';
import 'package:flutter_firts_prj/screens/note_list.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteKepper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.deepPurple
      ),
      home: NoteDetail(),
    );
  }

}
