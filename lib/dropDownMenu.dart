import 'package:flutter/material.dart';
import 'styles.dart';

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}
String dropdownValue = 'One';
class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
        color: Colors.white,
        child: Center(
          child: DropdownButton<String>(
              value: dropdownValue,
              iconEnabledColor: primaryColor,
              
              icon: Row(
                children: [
                    SizedBox(width:MediaQuery.of(context).size.width/2.5),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: primaryColor),
              onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
              }).toList(),
            ),
        ),
      ),
    );
  }
}