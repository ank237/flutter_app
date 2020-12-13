
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dummyData.dart';
class ListDescription extends StatefulWidget {
  ListDescription(
      this.index,
      );
  int index;
  @override
  _ListDescriptionState createState() => _ListDescriptionState();
}

class _ListDescriptionState extends State<ListDescription> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("${klist[widget.index]['title']}  ",
          style: TextStyle(
              fontSize: 12,
            color: Colors.indigo
          ),
        ),
        Container(
          height: width/14,
          width: width/2.5,
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Set a reminder',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 9.5
                ),
              ),
            ],
          ),
        ),
    Image.asset("${klist[widget.index]['image']}",width: width/7,),
      ],
    );
  }
}