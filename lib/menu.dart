import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/add_order.dart';
import 'package:flutterapp/order_list.dart';
import 'package:flutterapp/order_list_history.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xffffecc5) ,
        appBar: AppBar(
          title: Text('Live Pharmacy'),
          backgroundColor: Color(0xffff5f23),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child:Container(
                      width: 300,
                      height: 200,
                      padding: new EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color(0xffff5f23),
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                  'Create Order',
                                  style: TextStyle(fontSize: 30.0, color: Colors.white),textAlign: TextAlign.center,
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                      context,
                      new MaterialPageRoute(
                      builder: (context) => AddOrder()));
                    }


                  ),
                  GestureDetector(
                    child: Container(
                      width: 300,
                      height: 200,
                      padding: new EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color(0xffff5f23),
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                  'Current Order',
                                  style: TextStyle(fontSize: 30.0, color: Colors.white),textAlign: TextAlign.center,
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                      onTap: (){
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => OrderList()));
                      }
                  ),


                  GestureDetector(
                      child: Container(
                        width: 300,
                        height: 200,
                        padding: new EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Color(0xffff5f23),
                          elevation: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const ListTile(
                                title: Text(
                                    'Order History',
                                    style: TextStyle(fontSize: 30.0, color: Colors.white),textAlign: TextAlign.center,
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => OrderListHistory()));
                      }
                  )
                ]
            )

        )
    );
  }
}