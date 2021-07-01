import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator App',
      home: SIForm(),
    )
  );
}

class SIForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }

}

class _SIFormState extends State<SIForm>{
  var _currencies = ['Dollar', "Pound", "Korean Won", "VND"];
  var _currentItemSelected = "Dollar";
  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(title:Text("Simple Interest Calculator App")),
      body:Container(
        margin:EdgeInsets.all(_minimumPadding*2),
        child: ListView(
          children: <Widget>[
          getImageAsset(),
          
          Padding(
            padding:EdgeInsets.all(_minimumPadding),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                labelText: 'Principal',
                hintText: 'Enter Principal e.g. 12000',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
              )
            )
          ),
          Padding(
            padding:EdgeInsets.all(_minimumPadding),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                labelText: 'Rate of Interest',
                hintText: 'In Percent',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
              )
            )
          ),
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: Row(            
              children:<Widget>[
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration:InputDecoration(
                      labelText: 'Term',
                      hintText: 'Time in years',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    )
                  )
                ),
                Container(width:_minimumPadding*5),

                Expanded(child: DropdownButton<String>(
                    items: _currencies.map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e
                      )
                    ).toList(),
                    value: _currencies[0],
                    onChanged: (String? newValueSelected) =>{},
                  )
                )
              ]
          )),
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: Row( 
              children: <Widget>[
                Expanded(
                  child:ElevatedButton(
                    child: Text(
                      'Calculate',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize:20.0,
                        fontFamily: "Roboto",
                        fontWeight:FontWeight.w700
                      )
                    ),
                    onPressed: ()=>{},
                    style:ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      elevation: 6.0,  
                    )
                  )
                ),
                Container(),
                Expanded(
                  child:ElevatedButton(
                    child: Text(
                      'Reset',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize:20.0,
                        fontFamily: "Roboto",
                        fontWeight:FontWeight.w700
                      )
                    ),
                    onPressed: ()=>{},
                    style:ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      elevation: 6.0,  
                    )
                  )
                )
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: Text("Todo Text")
          )
        ],
        ),
      )
    );
  }

  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('images/money.png');

    return Container(
        child: Image(
          image:assetImage, width:125.0, height:125.0
        ),
        margin:EdgeInsets.all(_minimumPadding*10)

      );
  }
}