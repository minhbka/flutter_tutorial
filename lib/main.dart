import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stateful App Example',
      home: FavoriteCity(),
    )
  );
}

class FavoriteCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity>{
  String nameCity ="";
  var _currencies = ['Dollar', "Pound", "Korean Won", "VND"];
  var _currentItemSelected = "Dollar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful App Example')
      ),
      body: Container(
        margin:EdgeInsets.all(20.0),
        child:Column(
          children:<Widget>[
            TextField(
              //onChange:
              onSubmitted: (String userInput) => {
                setState(()=> nameCity = userInput)
              }
            ),
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child:Text(dropDownStringItem),
                );
              }).toList(),

              onChanged: (String? newValueSelected){
                _onDropDownItemSelected(newValueSelected);
                
              },
              
              value: _currentItemSelected,
            ),
            Padding(
              padding:EdgeInsets.all(30.0),
              child: Text(
              "Your best city is " + nameCity,
              style: TextStyle(fontSize: 20.0)
            )
            ),
          ]
        )
      ),
    );

  }

  void _onDropDownItemSelected(String newValueSelected){
    setState((){
      this._currentItemSelected = newValueSelected!;
    });
  }

}