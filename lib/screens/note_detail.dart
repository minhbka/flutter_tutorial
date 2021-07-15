import 'package:flutter/material.dart';
import 'package:flutter_firts_prj/models/note.dart';
import 'package:flutter_firts_prj/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget{
  final String appBarTitle;
  final Note note;
  NoteDetail(this.note, this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail>{
  String appBarTitle;
  Note note;
  NoteDetailState(this.note, this.appBarTitle);
  static var _priorities = ["High", "Low"];
  DatabaseHelper helper = new DatabaseHelper();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6!;
    titleController.text = note.title!;
    descriptionController.text = note.description!;
    return WillPopScope(
      onWillPop: () async{
        return moveToLastScreen();
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: (){
            moveToLastScreen();     
          }
        ),
      ),
      body: Padding(
        padding:EdgeInsets.only(top:15.0, left:10.0, right:10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title:DropdownButton(
                items:_priorities.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                  child: Text(dropDownStringItem),
                  value: dropDownStringItem,
                  );
                }).toList(),
                style: textStyle,
                value:getPriorityAsString(note.priority!),
                onChanged:(valueSelectedByUser){
                  setState(() {
                    debugPrint('User selected: $valueSelectedByUser');
                    updatePriorityAsInt(valueSelectedByUser.toString());
                  });
                },
              )
            ),
            Padding(
              padding:EdgeInsets.only(top:15, bottom:15,),
              child: TextField(
                controller:titleController,
                onChanged:(value) {
                  debugPrint("Something changed in Title TextField: $value");
                  updateTitle();
                },
                decoration:InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                )
              )
            ),
            Padding(
              padding:EdgeInsets.only(top:15, bottom:15,),
              child: TextField(
                controller:descriptionController,
                onChanged:(value){
                  debugPrint("Something changed in Description TextField: $value");
                  updateDescription();
                },
                decoration:InputDecoration(
                  labelText: 'Description',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                )
              )
            ),
            Padding(
              padding:EdgeInsets.only(top:15, bottom:15,),
              child:Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child:Text("Save",
                        textScaleFactor: 1.5,
                        style:TextStyle(
                          color:Theme.of(context).primaryColorLight,
                        )
                      ),
                      onPressed: (){
                        setState(() {
                          debugPrint("Save button clicked");
                          _save();
                        });
                      },
                      style:ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                        elevation: 6.0,  
                      )
                    )
                  ),
                  Container(width: 5.0,),
                  Expanded(
                    child: ElevatedButton(
                      child:Text("Delete",
                        
                        textScaleFactor: 1.5,
                        style:TextStyle(
                          color:Theme.of(context).primaryColorLight,
                        )
                      ),
                      
                      onPressed: (){
                        setState(() {
                          debugPrint("Delete button clicked");
                          _delete();
                        });
                      },
                      style:ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                        elevation: 6.0,  
                      )
                    )
                  )
                ]
              )
            )
          ],
      )
      )
    )
    );
  }

  bool moveToLastScreen(){
    Navigator.pop(context, true);
    return true;
  }

  void updatePriorityAsInt(String value){
    switch(value){
      case "High":
        note.priority = 1;
        break;
      
      case "Low":
        note.priority = 2;
        break;
    }
  }

  String getPriorityAsString(int value){
    
    switch(value){
      case 1: return _priorities[0];
      case 2: return _priorities[1];
      default: return _priorities[1];
    }
  }

  void updateTitle(){
    note.title = titleController.text;

  }

  void updateDescription(){
    note.description = descriptionController.text;
  }

  void _save() async {
    moveToLastScreen();
    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if(note.id != null){
      result = await helper.updateNote(note);
    }else{
      result = await helper.insertNote(note);
    }

    if(result != 0){
      _showAlertDialog("Status", "Note is saved successfully");
    }else{
      _showAlertDialog("Status", "Problem while saving note");
    }
  }

  void _delete() async {
    moveToLastScreen();
    if(note.id == null){
      _showAlertDialog("Status", "No note to delete");
      return;
    }
    
    int result = await helper.deleteNote(note.id!);
    if(result != 0){
      _showAlertDialog("Status", "Note is deleted successfully");
    }else{
      _showAlertDialog("Status", "Problem while deleting note");
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = new AlertDialog(
      title:Text(title), 
      content:Text(message));
    showDialog(context: context, builder: (_)=>alertDialog);
  }
}