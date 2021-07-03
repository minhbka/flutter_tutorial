import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget{
  String appBarTitle;
  NoteDetail(this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail>{
  String appBarTitle;
  NoteDetailState(this.appBarTitle);
  static var _priorities = ["High", "Low"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6!;
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
                value:_priorities[0],
                onChanged:(valueSelectedByUser){
                  setState(() {
                    debugPrint('User selected: $valueSelectedByUser');
                  });
                },
              )
            ),
            Padding(
              padding:EdgeInsets.only(top:15, bottom:15,),
              child: TextField(
                controller:titleController,
                onChanged:(value) => debugPrint("Something changed in Title TextField: $value"),
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
                onChanged:(value) => debugPrint("Something changed in Description TextField: $value"),
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
                      onPressed: ()=> debugPrint("Save button clicked"),
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
                      
                      onPressed: ()=> debugPrint("Delete button clicked"),
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
    Navigator.pop(context);
    return true;
  }
}