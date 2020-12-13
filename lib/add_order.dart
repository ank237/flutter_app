import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddOrder extends StatefulWidget {
  @override
  _AddOrderState createState() => _AddOrderState();
}
class _AddOrderState extends State<AddOrder> {
  bool isSwitched = false;

  bool paid = false;
  bool cod= false;

  String name,phone,address,medicine_name,amount;
  final namefield = TextEditingController();
  final addressfield = TextEditingController();
  final medicine_namefield = TextEditingController();
  final amountfield = TextEditingController();
  final phonefield = TextEditingController();

  var successMessage='';




  @override
    Widget build(BuildContext context) {
      return Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Color(0xffffecc5) ,
          appBar: AppBar(
            title: Text('Create Order'),
            backgroundColor: Color(0xffff5f23),
          ),

          body: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        onChanged: (text) {
                          name=text;
                        },
                        controller: namefield,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Customer name',
                          hintText: 'Enter Your Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        onChanged: (text) {
                          phone=text;
                        },
                        controller: phonefield,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone number',
                          hintText: 'Enter Password',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        onChanged: (text) {
                          address=text;
                        },
                        controller: addressfield,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Delivery address',
                          hintText: 'Enter Your Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        onChanged: (text) {
                          medicine_name=text;
                        },
                        maxLines: 4,
                        controller: medicine_namefield,
                        decoration: InputDecoration(
                          fillColor: Color(0xffff5f23),
                          border: OutlineInputBorder(),
                          labelText: 'Medicine name',
                          hintText: 'Enter Your Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        onChanged: (text) {
                          amount=text;
                        },
                        maxLines: 1,
                        controller: amountfield,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          fillColor: Color(0xffff5f23),
                          border: OutlineInputBorder(),
                          labelText: 'Amount to be paid',
                          hintText: 'Enter Amount to be paid',
                        ),
                      ),
                    ),
                    Text('Is he a monthly subscriber ?'),
                    Switch(
                      value: isSwitched,
                      onChanged: (value){
                        setState(() {
                          isSwitched=value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.deepOrangeAccent[100],
                      activeColor: Color(0xffff5f23),
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xffff5f23),
                      child: Text('CREATE'),
                      onPressed: () {
                        phone !=null ? {} : phone=' ';
                        medicine_name !=null ? {} : medicine_name=' ';
                        name !=null && address !=null && amount !=null ?
                        FirebaseFirestore.instance
                            .collection('orders')
                            .add({'name': name,'address':address,'phone':phone,'medicine':medicine_name,'subscriber':isSwitched,'amount':amount,'delivered':false,'paid':false,'order_created_on':new DateTime.now()}).whenComplete(() => clear())
                        :setState(() {
                          successMessage = 'Error : Customer Name, Address or Amount cannot be null';
                        })
                        ;
                      },
                    ),
                      (successMessage != ''
                        ? Text(
                      successMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    )
                        : Container()),
                  ]
              )
          )
      );

    }

  clear() {
    setState(() {
      successMessage =
      'Order Succesfully Created';
    });
      namefield.clear();
      phonefield.clear();
      addressfield.clear();
      medicine_namefield.clear();
      amountfield.clear();
    new Future.delayed(const Duration(seconds: 2), () {
      // deleayed code here
      setState(() {
        successMessage = '';
      });
    });





  }

  }


