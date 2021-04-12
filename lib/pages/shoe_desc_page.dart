import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/helpers/helpers.dart';
import 'package:shoes/models/shoe_model.dart';
import 'package:shoes/widgets/custom_widgets.dart';

class ShowDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeLightState();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: 'shoe_1', child: ShoeSizePreview(fullScreen: true)),
              Positioned(
                  top: 20,
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60,
                    ),
                    onPressed: () {
                      changeDarkState();

                      Navigator.pop(context);
                    },
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                  ))
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ShoeDescription(
                      description:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                      title: "Nike Air Max 720"),
                  _AmountBoyNow(),
                  _Colors(),
                  _InteractionButtons()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InteractionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ShadedButton(
            icon: Icon(Icons.star, color: Colors.red, size: 26),
          ),
          _ShadedButton(
              icon: Icon(Icons.add_shopping_cart,
                  color: Colors.grey.withOpacity(0.4), size: 26)),
          _ShadedButton(
              icon: Icon(Icons.settings,
                  color: Colors.grey.withOpacity(0.4), size: 26))
        ],
      ),
    );
  }
}

class _ShadedButton extends StatelessWidget {
  final Icon icon;
  const _ShadedButton({
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
    );
  }
}

class _Colors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
              child: Stack(children: [
            Positioned(
                left: 90,
                child: _ColorsButton(
                    color: Color(0xffC6D642),
                    index: 4,
                    urlImagen: 'assets/imgs/verde.png')),
            Positioned(
                left: 60,
                child: _ColorsButton(
                    color: Color(0xffFFAD29),
                    index: 3,
                    urlImagen: 'assets/imgs/amarillo.png')),
            Positioned(
                left: 30,
                child: _ColorsButton(
                    color: Color(0xff2099F1),
                    index: 2,
                    urlImagen: 'assets/imgs/azul.png')),
            _ColorsButton(
                color: Color(0xff364D56),
                index: 1,
                urlImagen: 'assets/imgs/negro.png'),
          ])),
          CustomButtom(
              text: 'More related items',
              width: 170,
              height: 30,
              color: Color(0xffFFC675))
        ],
      ),
    );
  }
}

class _ColorsButton extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;
  const _ColorsButton({this.color, this.index, this.urlImagen});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
          final shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = this.urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _AmountBoyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 20),
        child: Row(
          children: [
            Text(
              '\$180',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: CustomButtom(
                text: 'Buy now',
                width: 120,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
