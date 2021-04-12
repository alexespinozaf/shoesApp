import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;
  const CustomButtom({@required this.text, this.height = 50, this.width = 150,this.color=Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.width ,
      height: this.height,
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(100)),
      child: Text(
        '$text',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
