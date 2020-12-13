import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/order_details.dart';
import 'package:flutterapp/order_list.dart';




class OrderListHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffecc5) ,
      appBar: AppBar(


        title: Text("Order History"),backgroundColor: Color(0xffff5f23),
        actions: <Widget>[
          RaisedButton(
            textColor: Colors.white,
            color: Color(0xffff5f23),
            child: Text('Orders',style: new TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),),
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OrderList()),
              );
            },
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0),side: BorderSide(color: Colors.white)),

          ),
//          FlatButton(
//            textColor: Colors.white,
//            onPressed: () {},
//            child: Text("Order History"),
//          shape: CircleBorder(side: BorderSide(color: Colors.white)),
//
//    ),
        ],

      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('orders').orderBy('delivered_On',descending: true).where('delivered',isEqualTo: true).snapshots(),
        builder: (context,snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(

            children: snapshot.data.docs.map<Widget>((document)   {

              return GestureDetector(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Name     : "+ document['name']+"\n\n"+ "Address : "+document['address']+"\n\n"+ "Phone    : "+document['phone']+"\n\n"+ "Amount  : Rs. "+document['amount'], style: TextStyle(fontSize: 22.0),
                    ),
                  ),



                ),
                onTap: (){
                  var doc_id=document.documentID;
                  DocumentReference doc_ref=FirebaseFirestore.instance.collection("orders").doc(doc_id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderDetails(document: doc_ref)),
                  );
                },
              );

            }).toList(),
          );
        },
      ),
    );
  }
}