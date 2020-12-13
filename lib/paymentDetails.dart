import 'package:flutter/material.dart';
import 'styles.dart';

class PaymentDetails extends StatelessWidget {

  PaymentDetails(this.name,this.paymentMethod,this.amount);

  final String name;
  final int paymentMethod;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
              Image.asset('assets/images/user.png', width: 20.0, height: 20.0),
              Text(name,style: TextStyle(color: primaryColor),),
              SizedBox(width:10),
              Flexible(fit: FlexFit.loose,child: Image.asset('assets/images/payM'+paymentMethod.toString()+'.png')),
              SizedBox(width:12),
              Text(amount.toString(),style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(width:10),
              Expanded(
                            child: RaisedButton(
                    padding: const EdgeInsets.symmetric(vertical:10),
                    color: primaryColor,
                    onPressed: (){},
                    child: FittedBox(child: Text(' Order Details ',maxLines: 1,overflow: TextOverflow.visible,style: TextStyle(color: Colors.white,),)),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                ),
          ),
              ),
        ],
      ),
    );
  }
}
