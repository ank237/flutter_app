import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedRadio;
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Container(child: ListView(children: [
        Container(
          padding: EdgeInsets.only(left:30.0,right:10.0,top:10.0,bottom: 10.0),
          height: 100.0,
          color: Color(0xFF4863bc),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.person,color: Colors.white,
                size: 30.0,),
              SizedBox(height: 10.0,),
              Text("Order details",style: TextStyle(color: Colors.white
                  ,fontWeight: FontWeight.bold,
                  fontSize: 25.0),)
            ],)
          ,),
        Padding(
            padding: EdgeInsets.all(10.0),
            child:
            Container(
              color: Colors.white54,
              child:
              Card(

                child:

                Column(children: [

                  Row(children: [
                    SizedBox(width: 10.0,),
                    Icon(Icons.person,color: Color( 0xFF4863bc
                    ),size: 22.0,),
                    SizedBox(width: 5.0,),
                    Text("Mr. Tejas Kumar",style: TextStyle(color: Color( 0xFF4863bc
                    ),
                        fontSize:16.0,fontWeight: FontWeight.w400),)
                  ],),
                  SizedBox(height: 10.0,),
                  Row(children: [
                    SizedBox(width: 10.0,),
                    Icon(Icons.location_on,color: Color( 0xFF4863bc
                    ),size: 25.0,),
                    SizedBox(width: 5.0,),
                    Flexible(
                      child:

                      Text("XYZ Colony ,flat number 2,building B Mumbai",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color( 0xFF4863bc
                        ),
                            fontSize:16.0,fontWeight: FontWeight.w400),),
                    )
                  ],),
                  SizedBox(height: 10.0,),
                  Row(children: [
                    SizedBox(width: 10.0,),
                    Icon(Icons.phone,color: Color( 0xFF4863bc
                    ),size: 25.0,),
                    SizedBox(width: 5.0,),
                    Text("+91 9876543210",style: TextStyle(color: Color( 0xFF4863bc
                    ),
                        fontSize:16.0,fontWeight: FontWeight.w400),),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 40.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Color(0xFF4863bc),)),
                        onPressed: () {},
                        padding: EdgeInsets.all(10.0),
                        color: Color(0xFF4863bc),
                        textColor: Colors.white,
                        child: Text("        CALL        ",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),





                  ],),
                  SizedBox(height: 10.0,),
                  Row(children: [
                    SizedBox(width: 10.0,),
                    Image.asset("assets/pills.png"),
                    SizedBox(width: 5.0,),
                    Text("20 pkt crocin advance",style: TextStyle(color: Color( 0xFF4863bc
                    ),
                        fontSize:16.0,fontWeight: FontWeight.w400),)
                  ],),
                  SizedBox(height: 10.0,),
                  Row(children: [
                    SizedBox(width: 10.0,),
                    Text("PAID VIA:",style: TextStyle(color: Color( 0xFF4863bc
                    ),
                        fontSize:16.0,fontWeight: FontWeight.w400),)

                  ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: selectedRadio,
                        onChanged: (val){},
                      ),
                      new Image.asset("assets/CASH.png"),
                      new Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (val){},
                      ),
                      new Image.asset("assets/googlePay.png",width: 50.0,height: 50.0,),
                      new Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (val){},
                      ),
                      new Image.asset("assets/phonePee.png",width: 60.0,height: 50.0,),

                    ],
                  ),
                  Row(children: [
                    new Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (val){},
                    ),
                    new Image.asset("assets/paytm.png",width: 60.0,height: 40.0,),]),
                  Row(children: [
                    SizedBox(width: 20.0,),
                    Text("Rs. 5767",style: TextStyle(color: Color(0xFF4863bc),
                        fontSize: 25.0,fontWeight: FontWeight.bold),),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 40.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Color(0xFF4863bc),)),
                        onPressed: () {},
                        padding: EdgeInsets.all(10.0),
                        color: Color(0xFF4863bc),
                        textColor: Colors.white,
                        child: Text("        DONE        ",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),

                  ],)

                ],)
                ,),))

      ],)),
    );

  }
}