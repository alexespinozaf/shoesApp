import 'package:flutter/material.dart';
import 'package:shoes/widgets/custom_widgets.dart';

class AddShoppingCard extends StatelessWidget {
  final double amount;
  AddShoppingCard({this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(children: [
          SizedBox(width:20),
          Text('\$$amount',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
          Spacer(),
          CustomButtom(text: 'Add to cart',),
          SizedBox(width:20),

        ],),
      ),
    );
  }
}
