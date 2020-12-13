import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
enum mode { Cash, G_Pay, Paytm, PhonePe, Pay_Later }

// ...

mode _mode = mode.Cash;



class OrderDetails extends StatefulWidget {

  final DocumentReference document;
  OrderDetails(  {Key key, @required this.document}) : super(key: key);
  @override
  _OrderDetailsState createState() => _OrderDetailsState(document);
}
class  _OrderDetailsState extends State<OrderDetails> {

  bool isSwitched = false;

  bool paid = false;
  bool cod= false;
  bool paytm= false;
  bool phonepe= false;
  bool gpay= false;

  DocumentReference document;



  _OrderDetailsState(this.document);
  DocumentSnapshot documentSnapshot;






  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection("orders").doc(document.id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        else if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Scaffold(
              resizeToAvoidBottomPadding: false,
              backgroundColor: Color(0xffffecc5) ,
              appBar: AppBar(
                title: Text('Delivery'),
                backgroundColor: Color(0xffff5f23),
              ),

              body: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                      children: <Widget>[
                        Text('Delivery',
                          style: TextStyle(
                              fontSize: 50,
                              color: Color(0xffff5f23),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child:Container(
                            margin: const EdgeInsets.only(top: 40.0),
                            height: (600),//ssa
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                  bottomLeft:  const Radius.circular(10.0),
                                  bottomRight: const Radius.circular(10.0),
                                )
                            ),
                            child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(' ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   Name       : '+data['name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   Location  : '+data['address'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   Number    : '+data['phone'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   Medicine  : '+data['medicine'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(' ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   PAID VIA',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),

                                  Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: const Text('CASH'),
                                        leading: Radio(
                                          value: mode.Cash,
                                          groupValue: _mode,
                                          onChanged: (mode value) {
                                            setState(() {
                                              _mode=value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('G-PAY'),
                                        leading: Radio(
                                          value: mode.G_Pay,
                                          groupValue: _mode,
                                          onChanged: (mode value) {
                                            setState(() {
                                              _mode=value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('PayTM'),
                                        leading: Radio(
                                          value: mode.Paytm,
                                          groupValue: _mode,
                                          onChanged: (mode value) {
                                            setState(() {
                                              _mode=value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('PhonePe'),
                                        leading: Radio(
                                          value: mode.PhonePe,
                                          groupValue: _mode,
                                          onChanged: (mode value) {
                                            setState(() {
                                              _mode=value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('Pay Later'),
                                        leading: Radio(
                                          value: mode.Pay_Later,
                                          groupValue: _mode,
                                          onChanged: (mode value) {
                                            setState(() {
                                              _mode=value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  //text
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text('Rs. '+data['amount'],
                                          style: TextStyle(
                                              fontSize: 36,
                                              color: Color(0xffff5f23),
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1
                                          ),
                                        ),
                                        RaisedButton(
                                          textColor: Colors.white,
                                          color: Color(0xffff5f23),
                                          child: Text('Done'),
                                          onPressed: (){
                                            FirebaseFirestore.instance.collection("orders").doc(document.id).update({"paid" : "true",
                                              "delivered" : true,
                                              "mode_of_payment": _mode.toString(),
                                              "delivered_By": FirebaseAuth.instance.currentUser.uid,
                                              "delivery_agent_email":FirebaseAuth.instance.currentUser.email,
                                              "delivered_On":new DateTime.now()
                                            }).whenComplete(() => Navigator.pop(context));
                                          },
                                        )

                                      ]
                                  )


                                ]
                            ),
                            /*Text('Delivery',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffff5f23),
                      fontWeight: FontWeight.w500,
                  ),
                ),*/
                          ),
                        )
                      ]
                  )
              )
          );
        }

        else {
          return Scaffold(
              resizeToAvoidBottomPadding: false,
              backgroundColor: Color(0xffffecc5) ,
              appBar: AppBar(
                title: Text('Delivery'),
                backgroundColor: Color(0xffff5f23),
              ),

              body: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                      children: <Widget>[
                        Text('Delivery',
                          style: TextStyle(
                              fontSize: 50,
                              color: Color(0xffff5f23),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child:Container(
                            margin: const EdgeInsets.only(top: 40.0),
                            height: (600),//ssa
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                  bottomLeft:  const Radius.circular(10.0),
                                  bottomRight: const Radius.circular(10.0),
                                )
                            ),
                            child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(' ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   Name       : ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   Location  : ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   Number    : ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   Medicine  : ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(' ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text('   PAID VIA',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Color(0xffff5f23),
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),

                                  Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: const Text('CASH'),
                                        leading: Radio(
                                          value: mode.Cash,
                                          groupValue: _mode,
                                          onChanged: (mode value) {

                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('G-PAY'),
                                        leading: Radio(
                                          value: mode.G_Pay,
                                          groupValue: _mode,
                                          onChanged: (mode value) {

                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('PayTM'),
                                        leading: Radio(
                                          value: mode.Paytm,
                                          groupValue: _mode,
                                          onChanged: (mode value) {

                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('PhonePe'),
                                        leading: Radio(
                                          value: mode.PhonePe,
                                          groupValue: _mode,
                                          onChanged: (mode value) {

                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('Pay Later'),
                                        leading: Radio(
                                          value: mode.Pay_Later,
                                          groupValue: _mode,
                                          onChanged: (mode value) {

                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  //text
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text('Rs. ',
                                          style: TextStyle(
                                              fontSize: 36,
                                              color: Color(0xffff5f23),
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1
                                          ),
                                        ),
                                        RaisedButton(
                                          textColor: Colors.white,
                                          color: Color(0xffff5f23),
                                          child: Text('Done'),
                                          onPressed: (){

                                          },
                                        )

                                      ]
                                  )


                                ]
                            ),
                            /*Text('Delivery',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffff5f23),
                      fontWeight: FontWeight.w500,
                  ),
                ),*/
                          ),
                        )
                      ]
                  )
              )
          );
        }


      },
    );
  }

}




