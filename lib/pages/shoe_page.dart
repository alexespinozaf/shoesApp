import 'package:flutter/material.dart';
import 'package:shoes/helpers/helpers.dart';
import 'package:shoes/widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeDarkState();
    return Scaffold(
        // body: CustomAppBar(texto:'For you')
        body: Column(
      children: [
        CustomAppBar(texto: 'For you'),
        SizedBox(height: 10),
        Expanded(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Hero(
                tag: 'shoe_1',
                child: ShoeSizePreview()),
              ShoeDescription(
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  title: "Nike Air Max 720")
            ],
          ),
        )),
        AddShoppingCard(amount:180.0)
      ],
    ));
  }
}
