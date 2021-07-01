import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Center(
      child: Container(
        padding:EdgeInsets.only(left:10.0, top:40.0),
        alignment: Alignment.center,
        color: Colors.deepPurple,
        // width:200.0,
        // height:100.0,
        // margin:EdgeInsets.only(left: 35.0),
        child: Column(
          children:<Widget>[
            Row(
              children:<Widget>[
                Expanded(child: Text("Jeju Air",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0, 
                      color:Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight:FontWeight.w300,
                      // fontStyle: FontStyle.italic,
                    )
                  )
                ),
                Expanded(child: Text(
                    "From Seoul to Hanoi via HongKong",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0, 
                        color:Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight:FontWeight.w300,
                    // fontStyle: FontStyle.italic,
                    )
                  )
                )
              ]
            ),
            Row(
              children:<Widget>[
                Expanded(child: Text("Air Seoul",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0, 
                      color:Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight:FontWeight.w300,
                      // fontStyle: FontStyle.italic,
                    )
                  )
                ),
                Expanded(child: Text(
                    "From Busan to Nha Trang",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0, 
                        color:Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight:FontWeight.w300,
                    // fontStyle: FontStyle.italic,
                    )
                  )
                )
              ]
            ),
            FlightImageAsset(),
            FlightBookingButton(),
          ],
        )
      )
    );
  }
}

class FlightImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = new AssetImage("images/flight.png");
    Image image = Image(image:assetImage, width:250.0, height:250.0);
    return Container(child:image);
  }
}

class FlightBookingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top:30.0),
      width:250.0, 
      height:50.0,
      child:ElevatedButton(
        child: Text(
          "Book Your Flight",
          style:TextStyle(
            color:Colors.white,
            fontSize:20.0,
            fontFamily: "Roboto",
            fontWeight:FontWeight.w700
          )
        ),
        onPressed: ()=> bookFlight(context),
        style:ElevatedButton.styleFrom(
          primary: Colors.deepOrange,
          elevation: 6.0,  
        )
      )
    );
  }
  void bookFlight(BuildContext context) {
    var alertDialog = new AlertDialog(
      title:Text("Flight Booked Successfully"),
      content:Text("Have a good time")
    );
    showDialog(
      context:context,
      builder: (BuildContext context) => alertDialog
    );
  }

}