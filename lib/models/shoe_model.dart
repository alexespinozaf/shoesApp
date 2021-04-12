import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier{

  String _assetImage = 'assets/imgs/azul.png';
  double _shoeSize=9.0;
  String get assetImage => this._assetImage;
  set assetImage(String valor){
    this._assetImage =valor;
    notifyListeners();
  }
  double get shoeSize => this._shoeSize;
  set shoeSize(double valor){
    this._shoeSize =valor;
    notifyListeners();
  }
}