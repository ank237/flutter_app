import 'package:flutter/material.dart';
import 'paymentDetails.dart';
import 'styles.dart';
import 'package:intl/intl.dart';
import 'dropDownMenu.dart';

Map<DateTime, List<PaymentDetails>> paymentMap= {
  DateTime(2020,DateTime.november,19):[PaymentDetails('Mr. Tejas Kumar',1,5676),PaymentDetails('Mr. Tejas Kumar',3,7654),],
  DateTime(2020,11,18):[PaymentDetails('Mr. Tejas Kumar',2,5676),PaymentDetails('Mr. Tejas Kumar',1,5676),PaymentDetails('Mr. Tejas Kumar',0,5676),],
  DateTime(2020,11,17):[PaymentDetails('Mr. Tejas Kumar',2,5676),PaymentDetails('Mr. Tejas Kumar',1,7654),PaymentDetails('Mr. Tejas Kumar',3,5676),PaymentDetails('Mr. Tejas Kumar',0,5676),]
};

class Payment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text('Show',style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w900,
              ),),
              SizedBox(width:30,),
              DropDownMenu(),
            ],
          ),
        ),
        SizedBox(height:10),
        Expanded(
                  child: ListView.builder(
              shrinkWrap: true,
              itemCount: paymentMap.length,
              itemBuilder: (context, index){
                var key=paymentMap.entries.elementAt(index).key;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:getpaymentList(key),
                  );
          },
          ),
        ),

        ],
    );
  }

  getpaymentList(DateTime key) {
    List<Widget> values=[];
    values.add(SizedBox(height:5));
    values.add(Text(DateFormat('d MMMM, y').format(key),style: TextStyle(
      color: primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),));
    values.add(SizedBox(height:8));
    paymentMap[key].forEach((element) {
             values.add(PaymentDetails(element.name,element.paymentMethod,element.amount));
    });
    return values;
  }
}



