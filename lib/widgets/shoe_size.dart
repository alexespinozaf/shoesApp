import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/models/shoe_model.dart';
import 'package:shoes/pages/shoe_desc_page.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoeSizePreview({this.fullScreen = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ShowDescriptionPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (this.fullScreen) ? 5 : 30,
            vertical: (this.fullScreen) ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 390 : 380,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: (!this.fullScreen)
                ? BorderRadius.circular(50)
                : BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              //Zapato con sombra
              _Shoe(),
              if (!this.fullScreen) _ShoeSize()
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ShoeSizeBox(7),
          _ShoeSizeBox(7.5),
          _ShoeSizeBox(8),
          _ShoeSizeBox(8.5),
          _ShoeSizeBox(9),
          _ShoeSizeBox(9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  final double size;
  const _ShoeSizeBox(this.size);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () {
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.shoeSize = this.size;
      },
      child: Container(
          child: Text(
            '${size.toString().replaceAll('.0', '')}',
            style: TextStyle(
                color: (this.size == shoeModel.shoeSize)
                    ? Colors.white
                    : Color(0xffF1A23A),
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: (this.size == shoeModel.shoeSize)
                ? Color(0xffF1A23A)
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              if (this.size == shoeModel.shoeSize)
                BoxShadow(
                    color: Color(0xffF1A23A),
                    blurRadius: 10,
                    offset: Offset(0, 5))
            ],
          )),
    );
  }
}

class _Shoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Positioned(bottom: 20, right: 0, child: _SlipperShadow()),
          Image(image: AssetImage(shoeModel.assetImage))
        ],
      ),
    );
  }
}

class _SlipperShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)],
          )),
    );
  }
}
