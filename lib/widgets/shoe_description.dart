import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title;
  final String description;

  const ShoeDescription({@required this.description, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(this.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          Text(this.description, style: TextStyle(color:Colors.black54,height: 1.6)),
        ],
      ),
    );
  }
}
