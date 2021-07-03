import 'package:flutter/material.dart';
class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }

}

class NoteListState extends State<NoteList>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Notes"),
      ),
      body:getNoteListview(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>debugPrint("FAB clicked"),
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
                backgroundColor:Colors.yellow,
                child:Icon(Icons.keyboard_arrow_right)
              ),
              title: Text("Dummy Title", style: titleStyle),
              subtitle:Text("Dummy Date"),
              trailing: Icon(Icons.delete),
              onTap:()=>debugPrint("ListTile Tapped: "),
            )            
          );
        }
    );
  }
}