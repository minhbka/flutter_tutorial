import 'package:flutter/material.dart';
import 'package:flutter_firts_prj/screens/note_detail.dart';
import 'package:flutter_firts_prj/models/note.dart';
import 'package:flutter_firts_prj/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
class NoteList extends StatefulWidget{
  

  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }

}

class NoteListState extends State<NoteList>{
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList = [];

  int count = 0;
  @override
  Widget build(BuildContext context) {
    updateListView();
    return Scaffold(
      appBar: AppBar(
        title:Text("Notes"),
      ),
      body:getNoteListview(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          debugPrint("FAB clicked");
          navigateToDetail(Note("", "", 2, ""), "Add Note");
        },
        tooltip: "Add Note",
      ),
    );
  }

  ListView getNoteListview() {
    TextStyle titleStyle = Theme.of(context).textTheme.headline6!;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child:ListTile(
              leading:CircleAvatar(
                backgroundColor:getPriorityColor(this.noteList[position].priority!),
                child:getPriorityIcon(this.noteList[position].priority!)
              ),
              title: Text(this.noteList[position].title!, style: titleStyle),
              subtitle:Text(this.noteList[position].date!),
              trailing: GestureDetector(
                child: Icon(Icons.delete, color: Colors.grey),
                onTap: (){
                  _delete(context, noteList[position]);
                }
              ),
              onTap:(){
                debugPrint("ListTile Tapped: ");
                navigateToDetail(this.noteList[position], "Edit Note");
              },
            )            
          );
        }
    );
  }

  Color getPriorityColor(int priority){
    switch (priority){
      case 1: return Colors.red;
      case 2: return Colors.yellow;
      default: return Colors.yellow;
    }
  }

  Icon getPriorityIcon(int priority){
    switch (priority){
      case 1: return Icon(Icons.play_arrow);
      case 2: return Icon(Icons.keyboard_arrow_right);
      default: return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async{
    if(note.id == null) return;
    int result = await databaseHelper.deleteNote(note.id!);
    if(result != 0 ){
      _showSnackBar(context, "Note is deleted successfully");
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context,String message){
    final snackBar = new SnackBar(content: Text(message),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context){
            return NoteDetail(note, title);
        }));
    if(result == true) {
      updateListView();
    }
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initDatabase();
    dbFuture.then((database){
      Future<List<Note>> noteListFuture =  databaseHelper.getNoteList();
      noteListFuture.then((noteList){
        setState((){
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}