import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator App',
      home: SIForm(),
      theme: ThemeData(
        primaryColor:Colors.indigo,
        accentColor:Colors.indigoAccent,
        brightness: Brightness.dark
      )
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
  var _currentItemSelected = "";
  final _minimumPadding = 5.0;
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayResult = "";
  
  @override
  void initState(){
    super.initState();
    _currentItemSelected= _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1!;
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
              style: textStyle,
              keyboardType: TextInputType.number,
              controller: principalController,
              decoration:InputDecoration(
                labelStyle: textStyle,
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
              style: textStyle,
              keyboardType: TextInputType.number,
              controller:roiController,
              decoration:InputDecoration(
                labelStyle: textStyle,
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
                    style:textStyle,
                    keyboardType: TextInputType.number,
                    controller: termController,
                    decoration:InputDecoration(
                      labelStyle: textStyle,
                      labelText: 'Term',
                      hintText: 'Time in years',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    )
                  )
                ),
                Container(width:_minimumPadding*5),

                Expanded(
                  child: DropdownButton<String>(
                    items: _currencies.map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e
                      )
                    ).toList(),
                    value: _currentItemSelected,
                    onChanged: (String? newValueSelected) =>_onDropDownItemSelected(newValueSelected!),
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
                      textScaleFactor: 1.5,
                      style:TextStyle(
                        color:Theme.of(context).primaryColor,
                        fontFamily: "Roboto",
                        fontWeight:FontWeight.w300
                      )
                    ),
                    onPressed: ()=>{
                      setState((){
                        this.displayResult = _calculateTotalReturns();
                      })
                    },
                    style:ElevatedButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      elevation: 6.0,  
                    )
                  )
                ),
                Container(),
                Expanded(
                  child:ElevatedButton(
                    child: Text(
                      'Reset',
                      textScaleFactor: 1.5,
                      style:TextStyle(
                        color:Theme.of(context).primaryColorLight,
                        fontFamily: "Roboto",
                        fontWeight:FontWeight.w300
                      )
                    ),
                    onPressed: ()=>setState(()=>_reset()),
                    style:ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColorDark,
                      elevation: 6.0,  
                    )
                  )
                )
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: Text(this.displayResult)
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

  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns(){
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    double totalAmountPayable = principal + (principal*roi*term)/100;
    String result = "After $term years, your investment will be worth $totalAmountPayable ${this._currentItemSelected}";
    return result;
  }

  void _reset(){
    this.principalController.text = "";
    this.termController.text = "";
    this.roiController.text = "";
    this.displayResult = "";
    this._currentItemSelected = _currencies[0];
  }
}