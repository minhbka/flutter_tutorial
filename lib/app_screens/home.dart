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
            )
          ],
        )
      )
    );
  }
}
